terraform {
  backend "gcs" {
    bucket = "final_demo"
    prefix = "terraform/state"
  }
}