# Terraform State Bucket for Foundations & Backend Configuration

module "state_bucket" {
  source      = "git::https://github.com/tribagus6/tf-gcp-module.git//modules/backend"
  project_id  = var.host_project_id
  bucket_name = "${var.host_project_id}-tfstate"
  region      = var.region
}

terraform {
  backend "gcs" {
    bucket = "bokap-platipus-tfstate"
    prefix = "foundations"
  }
}
