resource "aws_iam_policy" "policy" {
  count = var.create_policy ? 1 : 0

  name        = var.policy_name
  policy      = var.policy
  path        = var.policy_path  # optional , default value is "/" 
                                 # for more informations please check the terraform registery for aws   
  description = var.policy_description  # optional but it would be great to set it by default empty 
  tags        = var.tags
}

resource "aws_iam_role" "role" {
  name                   = var.role_name
  assume_role_policy     = var.assume_role_policy
  path                   = var.role_path # optional
  description            = var.role_description # optionalter
  tags                   = var.tags
}

resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy[0].arn
}

# Can't see an implementation when i need to use existant policies