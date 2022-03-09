resource "google_compute_network" "vpc_network" {
    name                    = "sentiment-analysis-network"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet_1" {
    name          = "subnet-01"
    ip_cidr_range = "10.10.10.0/24"
    region        = var.region
    network       = google_compute_network.vpc_network.name
}

resource "google_compute_firewall" "allow_http" {
    name    = "allow-http"
    network = google_compute_network.vpc_network.name

    allow {
        protocol = "tcp"
        ports    = ["80", "8080", "5000"]
    }

    target_tags = ["allow-http"]
}

resource "google_compute_firewall" "allow_ssh" {
    name    = "allow-ssh"
    network = google_compute_network.vpc_network.name

    allow {
        protocol = "tcp"
        ports    = ["22"]
    }

    target_tags = ["allow-ssh"]
}
