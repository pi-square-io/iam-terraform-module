variable "name" {
  description = "the role's name"
  type        = string
  default     = ""
}

variable "assume_role_policy" {
  description = "defining the policy of the role"
  type        = string
  default     = ""
}

variable "path" {
  description = "the role's path"
  type        = string
  default     = "/"
}

variable "description" {
  description = "role description"
  type        = string
  default     = "IAM role"
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}