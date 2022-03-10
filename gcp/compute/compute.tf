resource "google_compute_instance" "vm_instance" {
    name         = "sentiment-analysis-instance"
    machine_type = "f1-micro"

    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-2004-lts"
        }
    }

    network_interface {
        network = google_compute_network.vpc_network.name
        subnetwork = google_compute_subnetwork.subnet_1.name
        access_config {
        }
    }

    service_account {
        email  = google_service_account.sentiment_analysis_account.email
        scopes = ["cloud-platform"]
    }

    tags = ["allow-ssh", "allow-http"]
}
