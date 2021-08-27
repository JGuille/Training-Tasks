#General
project_id                  = "loadout-incoming"
gcp_region                  = "us-central1"
gcp_zone                    = "us-central1-a"


#VPC
gce_network_name            = "demo-network"
vpc_mtu                     = 1460
vpc_auto_create_subnetworks = false
gce_subnetwork_name         = "demo-subnetwork"
gce_subnet_ip               = "10.232.0.0/20"
gce_firewall_rule           = "allow-ssh"
gce_firewall_direction      = "INGRESS"
gce_firewall_range          = "0.0.0.0/0"
gce_firewall_protocol       = "tcp"
gce_firewall_port           = "22"


#GKE
name                        = "task2-cluster"
ip_range_pods               = "10.20.0.0/16"
ip_range_services           = "10.30.0.0/16"
node_pools = [ {
    name                    = "node-pools"
    machine_type            = "n1-standard-1"
    node_locations          = "us-central1-a"
    min_count               = 1
    max_count               = 2
    disk_size_gb            = 30 
} ]
regional                    = true
horizontal_pod_autoscaling  = true


#SQL
instance_name       = "task2-sql"
database_version    = "MYSQL_5_6"
tier                = "db-n1-standard-1"
database_name       = "gcp-training"
charset             = "utf8"
collation           = "utf8_general_ci"
host                = "%"
activation_policy   = "ALWAYS"
db_username         = "root"
db_password         = "insecurepassword"