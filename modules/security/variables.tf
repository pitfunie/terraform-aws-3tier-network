# Accept secret ARNs via variables.tf
variable "secret_arns" {
  type        = list(string)
  description = "List of Secrets Manager ARNs EC2 should access"
}

