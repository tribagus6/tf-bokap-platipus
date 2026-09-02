firewall_rules = {
  "allow-ssh-from-iap" = {
    direction     = "INGRESS"
    priority      = 1000
    source_ranges = ["35.235.240.0/20"]
    target_tags   = []
    allow = [{
      protocol = "tcp"
      ports    = ["22"]
    }]
  },
  "allow-internal-icmp" = {
    direction     = "INGRESS"
    priority      = 65534
    source_ranges = ["10.0.0.0/8"]
    target_tags   = []
    allow = [{
      protocol = "icmp"
      ports    = []
    }]
  },
  "allow-atlantis-webhook" = {
    direction     = "INGRESS"
    priority      = 1000
    source_ranges = ["0.0.0.0/0"]
    target_tags   = []
    allow = [{
      protocol = "tcp"
      ports    = ["4141"]
    }]
  }
}
