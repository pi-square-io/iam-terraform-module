resource "aws_iam_policy" "policy" {
  count = var.create_policy ? 1 : 0

  name        = var.policy_name
  policy      = var.policy
  path        = var.policy_path
  description = var.policy_description
  tags        = var.tags
}

resource "aws_iam_role" "role" {
  name                   = var.role_name
  assume_role_policy     = var.assume_role_policy
  path                   = var.role_path
  description            = var.role_description
  tags                   = var.tags
}

resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy[0].arn
}