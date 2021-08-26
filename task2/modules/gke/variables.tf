variable "project_id" {
  description = "The project ID to host the cluster in"
}
variable "name" {
  description = "The name for the GKE cluster"
  default     = "learnk8s-cluster"
}
variable "env_name" {
  description = "The environment for the GKE cluster"
  default     = "prod"
}
variable "gcp_region" {
  description = "The region to host the cluster in"
  default     = "us-central1"
}
variable "gcp_zone" {
  type        = string
  description = "GCP Zone"
  default     = "us-central1-a"
}
variable "gce_network_name" {
  type        = string
  description = "GCE Network Name"
}
variable "gce_subnetwork_name" {
  type        = string
  description = "GCE SubNetwork Name"
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
variable "ip_range_pods_name" {
  description = "The secondary ip range to use for pods"
  default     = "ip-range-pods"
}
variable "ip_range_services_name" {
  description = "The secondary ip range to use for services"
  default     = "ip-range-services"
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
      node_locations = "us-central1-c"
      min_count = 1
      max_count = 2
      disk_size_gb = 30 
    } ]
}
variable "ip_range_pods" {
  description = "The secondary ip range to use for pods"
  default     = "10.20.0.0/16"
}
variable "ip_range_services" {
  description = "The secondary ip range to use for services"
  default     = "10.30.0.0/16"
}