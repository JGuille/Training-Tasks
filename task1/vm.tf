# Create Google Cloud VM | vm.tf

# Create VM #1
resource "google_compute_instance" "vm_instance_public" {
  name         = "${var.app_name}-${var.app_environment}-vm"
  machine_type = "e2-standard-2"
  zone         = var.gcp_zone_1
  tags         = ["ssh","http"]

  boot_disk {
    initialize_params {
      image = "ubuntu-ghost"
    }
  }

  metadata_startup_script = file(var.startup_file)

  network_interface {
    network       = google_compute_network.vpc.name
    subnetwork    = google_compute_subnetwork.public_subnet_1.name
    access_config { }
  }
} 
