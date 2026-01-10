resource "aws_codebuild_project" "codebuild" {
  name                   = local.codebuild_name
  description            = "A CodeBuild environment responsible for executing Terraform bundles"
  service_role           = aws_iam_role.codebuild.arn
  build_timeout          = var.build_timeout
  concurrent_build_limit = 1

  artifacts {
    type = "CODEPIPELINE"
  }

  cache {
    type = "NO_CACHE"
  }

  logs_config {
    cloudwatch_logs {
      group_name = aws_cloudwatch_log_group.codebuild.name
    }
  }

  environment {
    compute_type = var.compute_type
    image        = var.image
    type         = "LINUX_CONTAINER"

    dynamic "environment_variable" {
      for_each = local.environment_variables
      content {
        name  = environment_variable.value.name
        type  = environment_variable.value.type
        value = environment_variable.value.value
      }
    }
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = var.buildspec
  }
}
