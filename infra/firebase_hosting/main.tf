variable "project_id" {}
variable "region" {}
variable "github_token" {}

provider "google-beta" {
  credentials           = try(file("gcp-terraform-sa-key.json"), null)
  project               = var.project_id
  billing_project       = var.project_id
  region                = var.region
  user_project_override = true
}

resource "google_firebase_hosting_site" "default" {
  provider = google-beta
  project  = var.project_id
  site_id  = var.project_id
}

resource "local_file" "firebase_json" {
  filename = "${path.module}/firebase.json"
  content  = <<EOT
{
  "hosting": {
    "public": "build/web",
    "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ]
  }
}
EOT
}

resource "google_service_account" "firebase_deployer" {
  account_id   = "firebase-deployer"
  display_name = "Firebase Hosting Deployer"
}

resource "google_project_iam_binding" "firebase_admin" {
  project = var.project_id
  role    = "roles/firebase.admin"
  members = [
    "serviceAccount:${google_service_account.firebase_deployer.email}"
  ]
}

resource "google_service_account_key" "firebase_deployer_key" {
  service_account_id = google_service_account.firebase_deployer.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

data "github_actions_public_key" "example_public_key" {
  repository = "shinonome-inc/yumemi-pg-hackathon-team4"
}

resource "github_actions_secret" "example_secret" {
  repository      = "shinonome-inc/yumemi-pg-hackathon-team4"
  secret_name     = "FIREBASE_SERVICE_ACCOUNT"
  plaintext_value = var.github_token
}
