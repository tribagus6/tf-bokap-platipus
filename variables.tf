variable "host_project_id" {}
variable "service_project_id" {}
variable "region" {}
variable "zone" {}
variable "network_name" {
  type    = string
  default = "shared-vpc-network"
}
variable "subnets" {
  type = map(object({
    region        = string
    ip_cidr_range = string
    secondary_ip_ranges = optional(list(object({
      range_name    = string
      ip_cidr_range = string
    })), [])
  }))
}
variable "firewall_rules" {
  type = map(object({
    direction = string
    priority  = number
    allow = list(object({
      protocol = string
      ports    = list(string)
    }))
    source_ranges = list(string)
    target_tags   = list(string)
  }))
}
