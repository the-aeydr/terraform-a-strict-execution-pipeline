data "aws_arn" "source_bucket" {
  arn = var.source_bucket
}

data "aws_arn" "artifact_bucket" {
  arn = var.artifacts_store
}

data "aws_arn" "codebuild_plan" {
  arn = var.codebuild.plan.arn
}

data "aws_arn" "codebuild_apply" {
  arn = var.codebuild.apply.arn
}
