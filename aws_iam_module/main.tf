module "policy_test" {
  name        = "policy_1"
  create_policy = false 
  source      = "./modules/iam-policy-module"
  policy      = jsonencode({
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
  path        = "/"
  description = "creating a new policy"
  tags = {
    PolicyDescription = "Policy created using heredoc policy"
  }
}

module "role_test" {
  name               = "role_1"
  source             = "./modules/iam-role-module"
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
  path               = "/"
  description        = "assign role to an existing aws policy"
  tags = {
    RoleDescription  = "Role created with a new policy"
  }
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = module.role_test.name
  # policy_arn = module.policy_test.arn
  policy_arn = data.aws_iam_policy.example.arn
}