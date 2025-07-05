resource "aws_codepipeline" "pipeline" {
  name     = var.name
  role_arn = aws_iam_role.codepipeline.arn

  artifact_store {
    location = data.aws_arn.artifact_bucket.resource
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "ReadTerraformBundleFromAWSS3"
      category         = "Source"
      owner            = "AWS"
      provider         = "S3"
      version          = "1"
      output_artifacts = ["source"]

      configuration = {
        S3Bucket             = data.aws_arn.source_bucket.resource
        S3ObjectKey          = "bundle.zip"
        PollForSourceChanges = false
      }
    }
  }

  stage {
    name = "Plan"

    action {
      name             = "Plan"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source"]
      output_artifacts = ["plan"]

      configuration = {
        ProjectName = trimprefix(data.aws_arn.codebuild_plan.resource, "project/")
      }
    }
  }

  stage {
    name = "Approve"

    action {
      name     = "Approval"
      category = "Approval"
      owner    = "AWS"
      provider = "Manual"
      version  = "1"
    }
  }

  stage {
    name = "Apply"

    action {
      name             = "Apply"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source", "plan"]
      output_artifacts = []

      configuration = {
        ProjectName   = trimprefix(data.aws_arn.codebuild_apply.resource, "project/")
        PrimarySource = "source"
      }
    }
  }
}
