# ==============================================================================
# Service Project 2: anak-platipus-2
# ==============================================================================

# 1. Enable required APIs
module "service_apis_2" {
  source     = "git::https://github.com/tribagus6/tf-gcp-module.git//modules/apis"
  project_id = "anak-platipus-2"
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

# 2. Attach to Host Project's Shared VPC
resource "google_compute_shared_vpc_service_project" "service_2" {
  host_project    = var.host_project_id
  service_project = "anak-platipus-2"
  depends_on      = [module.service_apis, google_compute_shared_vpc_host_project.host]
}

# 3. Provision dedicated GCS state bucket
module "service_state_bucket" {
  source      = "git::https://github.com/tribagus6/tf-gcp-module.git//modules/backend"
  project_id  = "anak-platipus-2"
  bucket_name = "anak-platipus-2-tfstate"
  region      = var.region

  depends_on = [module.service_apis_2]
}
