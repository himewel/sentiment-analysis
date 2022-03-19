terraform {
  required_version = ">=0.12.6"
  backend "gcs" {
    bucket = "tf-backend-080222"
    prefix = "terraform/state/compute"
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}
