module "codepipeline" {
  source = "./modules/pipeline"

  name            = local.pipeline_name
  artifacts_store = module.codebuild_artifacts.bucket_arn
  source_bucket   = module.sources.bucket_arn
  codebuild = {
    plan  = module.codebuild_plan_node.arn
    apply = module.codebuild_apply_node.arn
  }
}