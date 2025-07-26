# Step 1: IAM Role (modules/security/iam.tf)
#
#    Create aws_iam_role, aws_iam_policy, and aws_iam_instance_profile
#
#    Accept secret ARNs via variables.tf
#
#    Export instance_profile_name via outputs.tf


resource "aws_iam_role" "ec2_secrets_role" {
  name = "ec2_secrets_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "secrets_access" {
  name        = "secrets_access_policy"
  description = "Allows access to specified secrets"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = ["secretsmanager:GetSecretValue"]
      Resource = var.secret_arns
    }]
  })
}

resource "aws_iam_role_policy_attachment" "secrets_attachment" {
  role       = aws_iam_role.ec2_secrets_role.name
  policy_arn = aws_iam_policy.secrets_access.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_secrets_instance_profile"
  role = aws_iam_role.ec2_secrets_role.name
}

