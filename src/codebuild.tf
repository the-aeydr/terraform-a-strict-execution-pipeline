data "aws_caller_identity" "current" {}

module "codebuild_plan_node" {
  source = "./modules/codebuild"

  name            = local.codebuild_plan_name
  artifacts_store = module.codebuild_artifacts.bucket_arn
  buildspec       = file("${path.module}/buildspec/plan.yaml")
}

module "codebuild_apply_node" {
  source = "./modules/codebuild"

  name            = local.codebuild_apply_name
  artifacts_store = module.codebuild_artifacts.bucket_arn
  buildspec       = file("${path.module}/buildspec/apply.yaml")
}

module "codebuild_artifacts" {
  source = "./modules/pipeline-artifacts"

  bucket = "${data.aws_caller_identity.current.account_id}-${local.infra_name}-codebuild"
}

module "sources" {
  source = "./modules/pipeline-source"

  bucket = "${data.aws_caller_identity.current.account_id}-${local.infra_name}-sources"
}
