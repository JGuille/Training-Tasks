variable "project_id" {
  description = "The ID of the project in which the resource belongs"
  type        = string
}
variable "instance_name" {
  description = "The name of the instance. If the name is left blank, Terraform will randomly generate one when the instance is first created."
  default     = "task2-instance"
  type        = string
}
variable "database_version" {
  description = "The MySQL, PostgreSQL or SQL Server version to use"
  default     = "MYSQL_5_6"
  type        = string
}
variable "gcp_region" {
  description = "The region to host the cluster instance"
  default     = "us-central1"
  type        = string
}
variable "gcp_zone" {
  description = "GCP Zone"
  default     = "us-central1-a"
  type        = string
}

variable "tier" {
  description = "The machine type to use for the MySQL instance"
  default     = "n1-standard-1"
  type        = string
}
variable "activation_policy" {
  description = "This specifies when the instance should be active. Can be either ALWAYS, NEVER or ON_DEMAND"
  default     = "ALWAYS"
  type        = string
}
variable "gce_network_name" {
  description = "GCE Network Name"
  type        = string
}
variable "database_name" {
  description = "The name of the database"
  default     = "gpp-training"
  type        = string
}
variable "charset" {
  description = "The charset value"
  default     = "utf8"
  type        = string
}
variable "collation" {
  type        = string
  description = "The collation value"
  default     = "utf8_general_ci"
}
variable "host" {
  description = "The host the user can connect from. This is only supported for MySQL instances"
  default     = "%"
  type        = string
}
variable "db_username" {
  description = "Database administrator user"
  sensitive   = true
  type        = string
}
variable "db_password" {
  description = "Database administrator password"
  sensitive   = true
  type        = string
}