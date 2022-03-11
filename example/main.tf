module "aws_iam_module" {
  source        = "../aws_iam_module"
  managed_policy_arn = "arn:aws:iam::aws:policy/AmazonGlacierReadOnlyAccess"
  create_policy = false
  policy_name   = "my_new_plicy"
  policy_path   = "/"
  role_name        = "my_new_role"
  role_path        = "/"
  role_description = ""
  tags = {
    RoleDescription = "AWS IAM module"
  }
}