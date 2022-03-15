module "aws_iam_module" {
  source        = "../aws_iam_module"
  managed_policy_arn = "arn:aws:iam::aws:policy/AmazonGlacierReadOnlyAccess"
  create_policy = false
  policy_name   = "my_new_plicy"
  role_name        = "my_new_role" 
  policy_file_path = "../example/example.json"
  assume_role_file_path = "../example/assume_role.json"
  tags = {
    RoleDescription = "AWS IAM module"
  }
}