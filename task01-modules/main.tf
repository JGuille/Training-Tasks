module "vpc" {
  source                      = "./modules/uc1/vpc"
  project_id                  = var.project_id
  gce_network_name            = var.gce_network_name
  vpc_auto_create_subnetworks = var.vpc_auto_create_subnetworks
  vpc_mtu                     = var.vpc_mtu
  gce_subnetwork_name         = var.gce_subnetwork_name
  gce_subnet_ip               = var.gce_subnet_ip
  gcp_region                  = var.gcp_region
  gce_firewall_rule           = var.gce_firewall_rule
  gce_firewall_direction      = var.gce_firewall_direction
  gce_firewall_range          = var.gce_firewall_range
  gce_firewall_protocol       = var.gce_firewall_protocol
  gce_firewall_port           = var.gce_firewall_port
}

module "compute_instance" {
  source              = "./modules/uc1/compute_instance"
  gce_name            = var.gce_name
  gce_machine_type    = var.gce_machine_type
  gce_zone            = var.gce_zone
  gce_image_os        = var.gce_image_os
  gce_tag             = var.gce_tag
  gce_subnetwork_name = var.gce_subnetwork_name

  depends_on = [module.vpc]
}