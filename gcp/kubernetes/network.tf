resource "google_compute_network" "vpc" {
  name                    = "sentiment-analysis-kubernetes-network"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "subnet-01"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}
