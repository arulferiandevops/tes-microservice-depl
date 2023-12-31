terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.10.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = arul-lab-mmpd
  region = asia-southeast2
  credentials = ./keys.json
}