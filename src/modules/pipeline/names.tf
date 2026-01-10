locals {
  pipeline_name = var.name
  role_name     = "${local.pipeline_name}ServiceRole"
}