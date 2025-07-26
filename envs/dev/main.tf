 # Only provisions the S3 bucket + DynamoDB table for state storage. No infrastructure (network, compute, secrets, etc.) yet invoked.

module "state_backend" {
  source        = "../../../modules/state_backend"
  bucket_prefix = "3tier"
  environment   = "dev"
}

# State provisioning Network provisioning with subnets by tier and AZ Modular logic for scaling, tagging, IPv6, and tier-based routing

module "network" {
  source      = "../../modules/network"
  cidr_block  = "10.0.0.0/16"
  az_count    = 2
  enable_ipv6 = true
  tiers       = ["web", "app", "db"]
  tags        = {
    Environment = "dev"
    Owner       = "mic"
  }
}

module "security" {
  source       = "../../../modules/security"
  secret_arns  = ["arn:aws:secretsmanager:us-east-1:123456789012:secret:my-secret"]
}

module "compute" {
  source                = "../../../modules/compute"
  instance_profile_name = module.security.instance_profile_name
  ami_id                = "ami-0abcd1234abcd5678" # Example AMI
  instance_type         = "t3.micro"
}

