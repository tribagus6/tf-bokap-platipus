# Enable required Google APIs for Host Project

module "host_apis" {
  source     = "git::https://github.com/tribagus6/tf-gcp-module.git//modules/apis"
  project_id = var.host_project_id
  services = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "serviceusage.googleapis.com",
    "storage.googleapis.com"
  ]
}
