output "policy_arn" {
  description = "The ARN assigned by AWS to the created policy"
  value       = module.aws_iam_module.policy_arn
}

output "role_arn" {
  description = "The ARN assigned by AWS to the created role"
  value       = module.aws_iam_module.role_arn
}