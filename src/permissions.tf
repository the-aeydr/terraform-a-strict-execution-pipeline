resource "aws_iam_policy_attachment" "plan" {
  name       = "ReadOnlyPermissions"
  roles      = [module.codebuild_plan_node.iam_id]
  policy_arn = "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
}

resource "aws_iam_policy_attachment" "apply" {
  name       = "AdministratorPermissions"
  roles      = [module.codebuild_apply_node.iam_id]
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}
