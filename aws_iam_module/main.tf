module "policy_test"{
  name               = "policy_ 1"
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
  path               = ""
  description        = "creating a new policy"
  tags               = "policy_test_1"
}

module "role_test" {
  name               = "role_1"
  assume_role_policy = ""
  path               = ""
  description        = "assign role to an existing aws policy"
  tags               = "role_test_1"
  depends_on = [
    aws_iam_role_policy.role_test,
  ]
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}