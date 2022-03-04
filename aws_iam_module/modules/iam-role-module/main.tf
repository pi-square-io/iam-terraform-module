resource "aws_iam_role" "role" {
  name               = var.name
  assume_role_policy = var.policy
  path               = var.path
  description        = var.description
  tags               = var.tags
}