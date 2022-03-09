### AWS IAM module
#### Features
- Creating an Iam module which enables the creation of an IAM role attached to a newly created policy or to an existing one.
- Using terraform template_file to define the policy statement.

#### Usage
- Creating Iam role module
```sh
resource "aws_iam_policy" "policy" {
  count = var.create_policy ? 1 : 0

  name        = var.policy_name
  policy      = var.policy
  path        = var.policy_path
  description = var.policy_description
  tags        = var.tags
}

resource "aws_iam_role" "role" {
  name                   = var.role_name
  assume_role_policy     = var.assume_role_policy
  path                   = var.role_path
  description            = var.role_description
  tags                   = var.tags
}

resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy[0].arn
}
```
- Declaring the template_file
```sh
data "template_file" "policy" {
  template = file("./example.json")
vars = {
    bucket_name = "wrdpress-code"
  }
}
```

- Definig the terraform template_file
```sh
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
             "ec2:RunInstances",
                "ec2:StopInstances",
                "ec2:StartInstances",
                "ec2:TerminateInstances",
                "ec2:Describe*",
                "ec2:CreateTags",
                "ec2:RequestSpotInstances"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:ListBucket"
            ],
            "Resource": "arn:aws:s3:::${bucket_name}"
        }
    ]
}
```
- Testing the created iam module

```sh
module "aws_iam_module" {
  source        = "../aws_iam_module"
  create_policy = true
  policy_name   = "my_new_plicy"
  policy_path   = "/"
  policy = "${data.template_file.policy.rendered}"
  role_name        = "my_new_role"
  role_path        = "/"
  role_description = ""
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com, s3.amazonaws.com"
        }
      },
    ]
  })
  tags = {
    RoleDescription = "AWS IAM module"
  }
}
```
