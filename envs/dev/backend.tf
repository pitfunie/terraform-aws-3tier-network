terraform {
  backend "s3" {
    bucket         = "3tier-dev-tfstate"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "3tier-dev-tf-lock"
    encrypt        = true
  }
}

