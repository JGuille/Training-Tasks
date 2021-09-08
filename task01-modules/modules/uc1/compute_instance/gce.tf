resource "google_compute_instance" "vm-instance" {
  name         = var.gce_name
  machine_type = var.gce_machine_type
  zone         = var.gce_zone
  tags         = [var.gce_tag]

  boot_disk {
    initialize_params {
      image = var.gce_image_os
    }
  }

  metadata_startup_script = file("${path.module}/startup.sh")

  network_interface {
    subnetwork = var.gce_subnetwork_name
    access_config {}
  }
}