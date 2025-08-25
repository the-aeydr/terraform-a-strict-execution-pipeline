data "aws_iam_policy_document" "baseline" {
  statement {
    sid    = "SourceBucket"
    effect = "Allow"

    actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation",
      "s3:GetBucketVersioning",
    ]

    resources = [var.source_bucket]
  }

  statement {
    sid    = "ReadFromSourceBucket"
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion",
    ]

    resources = ["${var.source_bucket}/*"]
  }

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
    sid    = "CodeBuildTrigger"
    effect = "Allow"

    actions = [
      "codebuild:StartBuild",
      "codebuild:BatchGetBuilds"
    ]

    resources = [var.codebuild.apply.arn, var.codebuild.plan.arn]
  }

}

resource "aws_iam_role_policy" "baseline" {
  name   = "ServiceRolePolicy"
  role   = aws_iam_role.codepipeline.id
  policy = data.aws_iam_policy_document.baseline.json
}
