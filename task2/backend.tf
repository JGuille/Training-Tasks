terraform {
  backend "gcs" {
    bucket = "test_bucket_loadout"
    prefix = "terraform/state"
  }
}