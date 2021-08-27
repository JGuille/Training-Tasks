resource "google_compute_network" "network" {
  project                 = var.project_id
  name                    = var.gce_network_name
  auto_create_subnetworks = var.vpc_auto_create_subnetworks
  mtu                     = var.vpc_mtu
}
module "network_subnets" {
  source       = "terraform-google-modules/network/google//modules/subnets"
  project_id   = var.project_id
  network_name = var.gce_network_name

  subnets = [
    {
      subnet_name   = var.gce_subnetwork_name
      subnet_ip     = var.gce_subnet_ip
      subnet_region = var.gcp_region
    }
  ]

  secondary_ranges = {
    "${var.gce_subnetwork_name}" = [
      {
        range_name    = "${var.ip_range_pods_name}"
        ip_cidr_range = "${var.ip_range_pods}"
      },
      {
        range_name    = "${var.ip_range_services_name}"
        ip_cidr_range = "${var.ip_range_services}"
      },
    ]
  }

  depends_on = [google_compute_network.network]
}

module "firewall_rules" {
  source       = "terraform-google-modules/network/google//modules/firewall-rules"
  project_id   = var.project_id
  network_name = var.gce_network_name

  rules = [{
    name                    = var.gce_firewall_rule
    description             = null
    direction               = var.gce_firewall_direction
    priority                = null
    ranges                  = [var.gce_firewall_range]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = var.gce_firewall_protocol
      ports    = [var.gce_firewall_port]
    }]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }]

  depends_on = [google_compute_network.network]
}

resource "google_compute_global_address" "private_ip_address" {
  provider = google-beta

  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.network.id
  project       = var.project_id
}

resource "google_service_networking_connection" "private_vpc_connection" {
  provider = google-beta

  network                 = google_compute_network.network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}

output "network_id" {
  value = google_compute_network.network.id
}