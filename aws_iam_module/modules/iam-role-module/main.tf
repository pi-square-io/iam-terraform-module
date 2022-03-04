resource "aws_iam_role" "role" {
  name               = var.name
  assume_role_policy = var.assume_role_policy
  path               = var.path
  description        = var.description
  tags               = var.tags
}