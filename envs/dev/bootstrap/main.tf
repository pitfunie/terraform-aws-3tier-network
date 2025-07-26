module "state_backend" {
  source        = "../../../modules/state_backend"
  bucket_prefix = "3tier"
  environment   = "dev"
}

