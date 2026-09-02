network_name = "platipus-shared-vpc"

subnets = {
  "subnet-01" = {
    region        = "asia-east1"
    ip_cidr_range = "10.0.1.0/24"
    secondary_ip_ranges = [
      {
        range_name    = "gke-pod-dev-1"
        ip_cidr_range = "10.1.0.0/16"
      },
      {
        range_name    = "gke-svc-dev-1"
        ip_cidr_range = "10.2.0.0/20"
      }
    ]
  },
  "subnet-02" = {
    region              = "asia-east1"
    ip_cidr_range       = "10.0.2.0/24"
    secondary_ip_ranges = []
  }
}
