resource "aws_iam_policy" "policy" {
  count = var.create_policy ? 1 : 0

  name          = var.name
  policy        = var.policy
  path          = var.path
  tags          = var.tags
}