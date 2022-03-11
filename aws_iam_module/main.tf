resource "aws_iam_policy" "policy" {
  count = var.create_policy ? 1 : 0

  name        = var.policy_name
  policy      = "${data.template_file.policy.rendered}"
  path        = var.policy_path
  description = var.policy_description
  tags        = var.tags
}

resource "aws_iam_role" "role" {
  name                   = var.role_name
  assume_role_policy     = "${data.template_file.assume_role.rendered}"
  path                   = var.role_path
  description            = var.role_description
  tags                   = var.tags
}

resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  role       = aws_iam_role.role.name
  policy_arn = "${var.create_policy == true ? aws_iam_policy.policy[0].arn : data.managed_policy.arn}"
}