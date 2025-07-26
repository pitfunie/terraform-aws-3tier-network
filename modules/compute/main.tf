module "compute" {
  source                 = "./modules/compute"
  instance_profile_name  = module.security.instance_profile_name
  user_data              = templatefile("${path.module}/../../scripts/fetch_secret.sh.tpl", {
    secret_id = "my-secret-id"
    region    = "us-east-1"
  })
}

resource "aws_instance" "this" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  iam_instance_profile = var.instance_profile_name
  user_data            = var.user_data
  tags = {
    Name = "my-instance"
  }
}

