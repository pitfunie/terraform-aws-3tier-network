variable "cidr_block" {
  description = "CIDR block for VPC"
  type        = string
}

variable "az_count" {
  description = "Number of Availability Zones to use"
  type        = number
  default     = 2
}

variable "enable_ipv6" {
  description = "Whether to enable IPv6 addressing"
  type        = bool
}

variable "tiers" {
  description = "Application tiers for subnet segregation"
  type        = list(string)
}

variable "tags" {
  description = "Common tags applied to resources"
  type        = map(string)
}

