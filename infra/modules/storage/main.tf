variable "project_id" {}
variable "region" {}

provider "google-beta" {
  credentials           = try(file("gcp-terraform-sa-key.json"), null)
  project               = var.project_id
  billing_project       = var.project_id
  region                = var.region
  user_project_override = true
}

resource "google_app_engine_application" "default" {
  project     = var.project_id
  location_id = var.region
}

resource "google_firebase_storage_bucket" "default" {
  provider  = google-beta
  project   = var.project_id
  bucket_id = google_app_engine_application.default.default_bucket
}