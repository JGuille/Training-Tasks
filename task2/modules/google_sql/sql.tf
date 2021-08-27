resource "google_sql_database_instance" "master" {

  name                    = var.instance_name
  region                  = var.gcp_region

  depends_on = [google_service_networking_connection.private_vpc_connection]

  settings {
    tier                  = var.tier
    activation_policy     = var.activation_policy 
    ip_configuration {
      ipv4_enabled        = false
      private_network     = google_compute_network.private_network.id
    }
  }
}

# resource "google_sql_database" "database" {
#   name                    = var.database_name
#   instance                = "${google_sql_database_instance.master.name}"
#   charset                 = var.charset
#   collation               = var.collation

#   depends_on = [ google_sql_database_instance.master]
# }
# resource "google_sql_user" "users" {
#   name                    = var.db_username
#   instance                = "${google_sql_database_instance.master.name}"
#   host                    = var.host
#   password                = var.db_password

#     depends_on = [ google_sql_database_instance.master]
# }