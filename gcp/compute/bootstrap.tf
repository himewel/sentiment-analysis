terraform {
  required_version = ">=0.12.6"
  backend "gcs" {
    bucket = "tf-backend-080222"
    prefix = "terraform/state/compute"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.52.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}
