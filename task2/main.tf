module "vpc" {
  source                          = "./modules/vpc"
  project_id                      = var.project_id
  gce_network_name                = var.gce_network_name
  vpc_auto_create_subnetworks     = var.vpc_auto_create_subnetworks
  vpc_mtu                         = var.vpc_mtu
  gce_subnetwork_name             = var.gce_subnetwork_name
  gce_subnet_ip                   = var.gce_subnet_ip
  gcp_region                      = var.gcp_region
  gce_firewall_rule               = var.gce_firewall_rule
  gce_firewall_direction          = var.gce_firewall_direction
  gce_firewall_range              = var.gce_firewall_range
  gce_firewall_protocol           = var.gce_firewall_protocol
  gce_firewall_port               = var.gce_firewall_port
  ip_range_pods_name              = var.ip_range_pods_name
  ip_range_services_name          = var.ip_range_services_name
  ip_range_pods                   = var.ip_range_pods
  ip_range_services               = var.ip_range_services
}

module "gke" {
  source                          = "./modules/gke"
  project_id                      = var.project_id
  name                            = var.name
  regional                        = var.regional
  gcp_region                      = var.gcp_region
  gce_network_name                = var.gce_network_name
  gce_subnetwork_name             = var.gce_subnetwork_name
  ip_range_pods                   = var.ip_range_pods_name
  ip_range_services               = var.ip_range_services_name
  horizontal_pod_autoscaling      = var.horizontal_pod_autoscaling
  node_pools                      = var.node_pools

  depends_on = [module.vpc]
}

resource "google_sql_database_instance" "master" {

  name                    = var.instance_name
  region                  = var.gcp_region

  depends_on = [module.vpc]

  settings {
    tier                  = var.tier
    activation_policy     = var.activation_policy 
    ip_configuration {
      ipv4_enabled        = false
      private_network     = module.vpc.network_id
    }
  }
}

resource "google_sql_database" "database" {
   name                    = var.database_name
   instance                = "${google_sql_database_instance.master.name}"
   charset                 = var.charset
   collation               = var.collation

   depends_on = [ google_sql_database_instance.master]
 }

 resource "google_sql_user" "users" {
   name                    = var.db_username
   instance                = "${google_sql_database_instance.master.name}"
   host                    = var.host
   password                = var.db_password

     depends_on = [ google_sql_database_instance.master]
 }