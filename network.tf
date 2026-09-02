# Shared VPC Network, Subnets, NAT, and Firewall Rules

module "network" {
  source       = "git::https://github.com/tribagus6/tf-gcp-module.git//modules/network"
  project_id   = var.host_project_id
  network_name = var.network_name
  region       = var.region
  subnets      = var.subnets

  depends_on = [module.host_apis]
}

module "firewall" {
  source       = "git::https://github.com/tribagus6/tf-gcp-module.git//modules/firewall"
  project_id   = var.host_project_id
  network_name = module.network.vpc_name
  custom_rules = var.firewall_rules
}

resource "google_compute_shared_vpc_host_project" "host" {
  project    = var.host_project_id
  depends_on = [module.host_apis]
}
