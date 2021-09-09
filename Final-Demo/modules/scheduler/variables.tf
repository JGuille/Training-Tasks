variable "job_name" {
  type        = string
  description = "The Cloud Scheduler Job Name"
}
variable "job_description" {
  type        = string
  description = "The Cloud Scheduler Job Description"
}
variable "job_schedule" {
  type        = string
  description = "The Cloud Scheduler In cron format"
  default     = "*/5 * * * *"
}
variable "job_timezone" {
  type        = string
  description = "Specifies the time zone to be used in interpreting schedule"
  default     = "America/Mexico_City"
}
variable "job_region" {
  type        = string
  description = "Specifies the region of the scheduler"
  default     = "us-west4"
}
variable "topic_name" {
  type        = string
  description = "The name for the Pub/Sub topic"
}
