variable "instance_profile_name" {
  type        = string
  description = "IAM instance profile name for EC2"
}

variable "user_data" {
  type        = string
  description = "Rendered EC2 bootstrap script"
}

