terraform {
  required_version = ">= 1.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project = "dev-gcp-394616"
  region  = "us-central1"
}

variable "input_topic" {
  description = "Pub/Sub topic the job reads from, e.g. projects/dev-gcp-394616/topics/<name>."
  type        = string
}

variable "output_directory" {
  description = "GCS prefix the job writes windowed files to."
  type        = string
}
