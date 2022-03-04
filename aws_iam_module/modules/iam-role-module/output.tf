output "id" {
  description = "The role's ID"
  value       = try(aws_iam_role.role[0].id, "")
}

output "name" {
  description = "The name of the policy"
  value       = try(aws_iam_role.role[0].name, "")
}

output "arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = try(aws_iam_role.role[0].arn, "")
}

output "path" {
  description = "The path of the policy in IAM"
  value       = try(aws_iam_role.role[0].path, "")
}