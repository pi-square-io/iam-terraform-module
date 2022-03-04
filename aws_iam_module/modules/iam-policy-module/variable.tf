variable "create_policy" {
    description = "whether to create the IAM policy"
    type        = bool
    default     = true
}

variable "name" {
    description = "policy's name"
    type        = string
    default     = ""
}

variable "path" {
    description = "the policy's path"
    type        = string
    default     = "/"
}

variable "description" {
    description="policy description"
    type        = string
    default     = "IAM policy"
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}