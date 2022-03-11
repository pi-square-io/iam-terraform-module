output "policy_id" {
  description = "The policy's ID"
  value       = try(aws_iam_policy.policy[0].id, data.aws_iam_policy.managed_policy.id)
}

output "policy_name" {
  description = "The name of the policy"
  value       = try(aws_iam_policy.policy[0].name,data.aws_iam_policy.managed_policy.name)
}

output "policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = try(aws_iam_policy.policy[0].arn, data.aws_iam_policy.managed_policy.arn)
}

output "policy_path" {
  description = "The path of the policy in IAM"
  value       = try(aws_iam_policy.policy[0].path, data.aws_iam_policy.managed_policy.path)
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