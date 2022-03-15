### AWS IAM module
#### Features
- Creating an Iam module which enables the creation of an IAM role attached to a newly created policy or to an existing one.
- Using terraform template_file to define the policy statement and the assume role statement.

#### Usage
- Creating Iam role module
```sh
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
  policy_arn = "${var.create_policy == true ? aws_iam_policy.policy[0].arn : data.aws_iam_policy.managed_policy.arn}"
}
```
- Declaring the policy template_file
```sh
data "template_file" "policy" {
  template = file(var.policy_file_path)
}
```

- Definig the policy template_file
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
            "Resource": "arn:aws:s3:::wrdpress-code"
        }
    ]
}
```
- Declaring the assume role template_file
```sh
data "template_file" "assume_role" {
  template = file(var.assume_role_file_path)
}
```
- Defining the assume role template_file
```sh
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action":"sts:AssumeRole",
            "Sid": "",
            "Principal": {
                "Service" : "ec2.amazonaws.com"
            }
        } 
    ]   
}
```
- Testing the created iam module

```sh
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
```
