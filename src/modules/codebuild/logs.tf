resource "aws_cloudwatch_log_group" "codebuild" {
  name_prefix       = local.log_group_name
  retention_in_days = 180
}