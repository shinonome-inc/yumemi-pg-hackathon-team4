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
  ])
}

module "iam" {
  source     = "./modules/iam"
  project_id = var.project_id
  region     = var.region
}

module "firebase" {
  source     = "./modules/firebase"
  project_id = var.project_id
  region     = var.region
}
