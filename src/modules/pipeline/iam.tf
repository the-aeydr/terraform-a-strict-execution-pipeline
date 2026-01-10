data "aws_iam_policy_document" "codepipeline" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "codepipeline" {
  name_prefix        = local.role_name
  path               = "/infra/tfpipelines/"
  description        = "Allows Codepipeline to access resources necessary for Terraform Pipelines."
  assume_role_policy = data.aws_iam_policy_document.codepipeline.json
}
