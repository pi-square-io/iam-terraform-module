module "aws_iam_module" {
  source             = "../aws_iam_module"
  create_policy      = true
  policy_name        = "my_new_plicy"
  policy_path        = "/"
  policy             = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
  role_name          = "my_new_role"
  role_path          = "/"
  role_description   = ""
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  tags = {
    RoleDescription = "AWS IAM module"
  }
}