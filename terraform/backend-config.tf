terraform {
  backend "gcs" {
    bucket  = "aash-exercisebucket"
    prefix  = "state"

  }
  required_version = ">= 0.12.0"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.82.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}