data "aws_iam_policy" "managed_policy" {
  arn = var.managed_policy_arn
}

data "template_file" "policy" {
  template = file(var.policy_file_path)
}

data "template_file" "assume_role" {
  template = file(var.assume_role_file_path)
}