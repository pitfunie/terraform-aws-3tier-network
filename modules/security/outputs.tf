# Export instance_profile_name via outputs.tf

output "instance_profile_name" {
  value       = aws_iam_instance_profile.ec2_profile.name
  description = "IAM instance profile name for EC2"
}

