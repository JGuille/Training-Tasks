module "gke" {
  source                      = "terraform-google-modules/kubernetes-engine/google"
  project_id                  = var.project_id
  name                        = var.name
  regional                    = var.regional
  region                      = var.gcp_region
  network                     = var.gce_network_name
  subnetwork                  = var.gce_subnetwork_name
  ip_range_pods               = var.ip_range_pods_name
  ip_range_services           = var.ip_range_services_name
  horizontal_pod_autoscaling  = var.horizontal_pod_autoscaling
  node_pools                  = var.node_pools
}

module "gke_auth" {
  source = "terraform-google-modules/kubernetes-engine/google//modules/auth"
  depends_on   = [module.gke]
  project_id   = var.project_id
  location     = module.gke.location
  cluster_name = module.gke.name
}
resource "local_file" "kubeconfig" {
  content  = module.gke_auth.kubeconfig_raw
  filename = "kubeconfig-${var.env_name}"
}