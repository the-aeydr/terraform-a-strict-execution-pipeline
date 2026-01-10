locals {
  codebuild_name = var.name
  role_name      = "${local.codebuild_name}ServiceRole"
  log_group_name = "/codebuild/${local.codebuild_name}"
}