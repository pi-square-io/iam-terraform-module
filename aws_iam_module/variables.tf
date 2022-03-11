variable "managed_policy_arn" {
  description = "the aws managed policy arn"
  type        = string
}

variable "create_policy" {
  description = "whether to create the IAM policy"
  type        = bool
  default     = true
}

variable "policy_name" {
  description = "policy's name"
  type        = string
  default     = ""
}

variable "policy_path" {
  description = "the policy's path"
  type        = string
  default     = "/"
}

variable "policy_description" {
  description = "policy description"
  type        = string
  default     = "IAM role"
}

variable "policy" {
  description = "defining the policy"
  type        = string
  default     = ""
}

variable "existing_policy_arn" {
  description = "existing policy arn"
  type        = string
  default     = ""
}

variable "role_name" {
  description = "role's name"
  type        = string
  default     = ""
}

variable "role_path" {
  description = "the role's path"
  type        = string
  default     = "/"
}

variable "assume_role_policy" {
  description = "role policy"
  type        = string
  default     = "/"
}

variable "role_description" {
  description = "role description"
  type        = string
  default     = "IAM role"
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}