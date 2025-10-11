locals {
  context = {
    arn  = aws_codebuild_project.codebuild.arn
    logs = aws_cloudwatch_log_group.codebuild.arn
  }
}

output "arn" {
  description = "The ARN of the CodeBuild project."
  value       = local.context
}

output "iam_id" {
  value = aws_iam_role.codebuild.id
}