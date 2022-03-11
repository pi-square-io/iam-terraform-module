data "aws_iam_policy" "managed_policy" {
  arn = var.managed_policy_arn
}

data "template_file" "policy" {
  template = file("../example/example.json")
vars = {
    bucket_name = "wrdpress-code"
  }
}

data "template_file" "assume_role" {
  template = file("../example/assume_role.json")
}