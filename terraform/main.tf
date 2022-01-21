terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("../serviceaccountkey.json")

  project = "gcp-it-dr-bu-nonlive-f6j"
  region  = "europe-west1"
}

resource "google_compute_network" "vpc_network" {
  name = "adhungel-network-alternatives"
}