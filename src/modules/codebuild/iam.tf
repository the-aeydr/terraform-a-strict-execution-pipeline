data "aws_iam_policy_document" "codebuild" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "codebuild" {
  name_prefix        = local.role_name
  path               = "/infra/tfpipelines/"
  description        = "Allows CodeBuild to access resources necessary for Terraform Pipelines."
  assume_role_policy = data.aws_iam_policy_document.codebuild.json
}
