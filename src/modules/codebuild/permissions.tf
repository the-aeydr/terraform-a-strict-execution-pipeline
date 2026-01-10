data "aws_iam_policy_document" "baseline" {
  statement {
    sid    = "ArtifactsBucket"
    effect = "Allow"

    actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation",
      "s3:GetBucketVersioning",
    ]

    resources = [var.artifacts_store]
  }

  statement {
    sid    = "ReadWriteToArtifactsBucket"
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:PutObject",
    ]
    resources = ["${var.artifacts_store}/*"]
  }


  statement {
    sid    = "AllowWriteToLogs"
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["${aws_cloudwatch_log_group.codebuild.arn}:log-stream:*"]
  }
}

resource "aws_iam_role_policy" "baseline" {
  name   = "ServiceRolePolicy"
  role   = aws_iam_role.codebuild.id
  policy = data.aws_iam_policy_document.baseline.json
}
