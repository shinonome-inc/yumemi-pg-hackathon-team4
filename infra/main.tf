resource "google_project" "default" {
  name            = "Yumemi-PG-Hackathon-Team4"
  provider        = google-beta
  project_id      = var.project_id
  billing_account = var.billing_account

  labels = {
    "firebase" = "enabled"
  }
}

resource "google_project_service" "default" {
  provider = google-beta.no_user_project_override
  project  = google_project.default.project_id
  service  = each.key

  for_each = toset([
    "compute.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "cloudbilling.googleapis.com",
    "billingbudgets.googleapis.com",
    "firebase.googleapis.com",
    "firebaserules.googleapis.com",
    "firestore.googleapis.com",
    "serviceusage.googleapis.com",
    "identitytoolkit.googleapis.com",
    "firebasestorage.googleapis.com",
    "storage.googleapis.com",
    "cloudbuild.googleapis.com",
    "people.googleapis.com",
  ])
}

module "iam" {
  source     = "./modules/iam"
  project_id = var.project_id
  region     = var.region
}

module "firebase" {
  source              = "./modules/firebase"
  project_id          = var.project_id
  region              = var.region
  finger_print_sha1   = var.finger_print_sha1
  finger_print_sha256 = var.finger_print_sha256
}

module "authentication" {
  source     = "./modules/authentication"
  project_id = var.project_id
  region     = var.region
}

resource "google_storage_bucket" "deploy_bucket" {
  name                        = "terraform-gcp-learning-yo2-deploy-bucket"
  location                    = "US-WEST1"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true

  lifecycle {
    prevent_destroy = true
  }
}
