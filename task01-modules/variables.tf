variable "project_id" {
  type        = string
  description = "GCP Project ID"
}
variable "gcp_region" {
  type        = string
  description = "GCP Region"
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
variable "gce_tag" {
  type        = string
  description = "GCE Tag"
}
variable "gce_image_os" {
  type        = string
  description = "GCE Image OS"
}
variable "gce_name" {
  type        = string
  description = "GCE Name"
}
variable "gce_machine_type" {
  type        = string
  description = "GCE Machine Type"
}
variable "gce_zone" {
  type        = string
  description = "GCE Zone"
}