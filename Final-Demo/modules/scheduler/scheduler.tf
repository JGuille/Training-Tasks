resource "google_cloud_scheduler_job" "job" {
  name                  = var.job_name
  description           = var.job_description
  schedule              = var.job_schedule
  time_zone             = var.job_timezone
  attempt_deadline      = "320s"
  region                = var.job_region

  pubsub_target {
    # topic.id is the topic's full resource name.
    topic_name = var.topic_name
    data       = base64encode("test")
  }
}