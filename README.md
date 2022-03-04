# AWS Identity and Access Management (IAM) Terraform module
### Features
1. Create a policy module
2. Create a role module
3. Attach the created role to a new or an exiting policy

### Usage
#### Policy module 
```sh
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
```

#### Role module 
```sh
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
    RoleDescription = "Role created with a new policy"
  }
}
```
##### Note
The IAM assume_role_policy is a temporary security credentials that grant access to AWS resources, it is valid from 15 min uo to one hour.

After creating the two modules, we have to attach the created role to a policy which defines its permissions. For this
purpose we can use an already existing policy on AWS or we can creat a new policy that fits our needs.
1. Attach the created role to an existing policy 
We can retrieve the existing policy on AWS using its name or its arn, in this example we choose to use the policy's arn. For this purpose, we use  Data Sources: <https://www.terraform.io/language/data-sources>


```sh
resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = module.role_test.name
  policy_arn = data.aws_iam_policy.example.arn
}
```
2. Attach the created role to a policy which we have created using the policy module 

```sh
resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = module.role_test.name
  policy_arn = module.policy_test.arn
}
```
