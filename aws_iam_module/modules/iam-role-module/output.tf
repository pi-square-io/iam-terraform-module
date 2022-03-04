output "id" {
  description = "The role's ID"
  value       = try(aws_iam_role.role.id, "")
}

output "name" {
  description = "The name of the policy"
  value       = try(aws_iam_role.role.name, "")
}

output "arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = try(aws_iam_role.role.arn, "")
}

output "path" {
  description = "The path of the policy in IAM"
  value       = try(aws_iam_role.role.path, "")
}