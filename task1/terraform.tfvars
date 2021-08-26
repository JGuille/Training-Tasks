# Application Definition 
app_name        = "new-network" #do NOT enter any spaces
app_environment = "test" # Dev, Test, Prod, etc
app_project     = "loadout-incoming"

# GCP Settings
gcp_region_1  = "us-central1"
gcp_zone_1    = "us-central1-a"
gcp_auth_file = "/home/guillermo/loadout-incoming-1bbf3eda0f40.json"

# GCP Netwok
public_subnet_cidr_1  = "10.10.1.0/24"

# Startup Script
startup_file = "/home/guillermo/exercises/task1/startup.sh"