output "subnet_self_links" {
  description = "Self links of all subnets created in the Shared VPC"
  value       = module.network.subnet_self_links
}

output "service_state_bucket_anak_platipus_1" {
  description = "GCS bucket for anak-platipus-1 state"
  value       = module.service_state_bucket.bucket_name
}

output "service_state_bucket_anak_platipus_2" {
  description = "GCS bucket for anak-platipus-2 state"
  value       = module.service_state_bucket_2.bucket_name
}
