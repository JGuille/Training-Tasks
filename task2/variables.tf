variable "project_id" {
  type        = string
  description = "GCP Project ID"
}
variable "gcp_region" {
  type        = string
  description = "GCP Region"
}
variable "gcp_zone" {
  type        = string
  description = "GCP Zone"
}
variable "gce_network_name" {
  type        = string
  description = "GCE Network Name"
}
variable "vpc_mtu" {
  type        = number
  description = "VPC MTU Value"
}
variable "vpc_auto_create_subnetworks" {
  type        = bool
  description = "VPC Autocreate subnetwork flag"
}
variable "gce_subnetwork_name" {
  type        = string
  description = "GCE Subnetwork name"
}
variable "gce_subnet_ip" {
  type        = string
  description = "GCE Subnetwork IP"
}
variable "gce_firewall_rule" {
  type        = string
  description = "GCE Firewall Rule"
}
variable "gce_firewall_direction" {
  type        = string
  description = "GCE Firewall Direction"
}
variable "gce_firewall_range" {
  type        = string
  description = "GCE Firewall Range"
}
variable "gce_firewall_protocol" {
  type        = string
  description = "GCE Firewall Protocol"
}
variable "gce_firewall_port" {
  type        = string
  description = "GCE Firewall Port"
}
variable "name" {
  description = "The name for the GKE cluster"
  default     = "learnk8s-cluster"
}
variable "env_name" {
  description = "The environment for the GKE cluster"
  default     = "prod"
}
variable "ip_range_pods_name" {
  description = "The secondary ip range to use for pods"
  default     = "ip-range-pods"
}
variable "ip_range_services_name" {
  description = "The secondary ip range to use for services"
  default     = "ip-range-services"
}
variable "ip_range_pods" {
  description = "The secondary ip range to use for pods"
  default     = "10.20.0.0/16"
}
variable "ip_range_services" {
  description = "The secondary ip range to use for services"
  default     = "10.30.0.0/16"
}
variable "node_pools" {
    type = list(object({
      name                      = string
      machine_type              = string
      node_locations            = string
      min_count                 = number
      max_count                 = number
      disk_size_gb              = number
    }))
    default = [ {
      name = "node-pools"
      machine_type = "n1-standard-1"
      node_locations = "us-central1-a"
      min_count = 1
      max_count = 2
      disk_size_gb = 30 
    } ]
}
variable "regional" {
  type        = bool
  description = "Regional Cluster"
  default = true
}
variable "horizontal_pod_autoscaling" {
  type        = bool
  description = "Regional Cluster"
  default = true
}