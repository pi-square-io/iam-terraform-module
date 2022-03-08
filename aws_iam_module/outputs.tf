output "policy_id" {
  description = "The policy's ID"
  value       = try(aws_iam_policy.policy[0].id, "")
}

output "policy_name" {
  description = "The name of the policy"
  value       = try(aws_iam_policy.policy[0].name, "")
}

output "policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = try(aws_iam_policy.policy[0].arn, "")
}

output "policy_path" {
  description = "The path of the policy in IAM"
  value       = try(aws_iam_policy.policy[0].path, "")
}

output "role_id" {
  description = "The role's ID"
  value       = try(aws_iam_role.role.id, "")
}

output "role_name" {
  description = "The name of the policy"
  value       = try(aws_iam_role.role.name, "")
}

output "role_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = try(aws_iam_role.role.arn, "")
}

output "role_path" {
  description = "The path of the policy in IAM"
  value       = try(aws_iam_role.role.path, "")
}