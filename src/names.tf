locals {
  pipeline_name        = var.name
  infra_name           = lower(var.name)
  codebuild_apply_name = "${local.pipeline_name}Apply"
  codebuild_plan_name  = "${local.pipeline_name}Plan"
}