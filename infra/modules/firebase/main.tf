variable "project_id" {}
variable "region" {}

provider "google-beta" {
  credentials           = try(file("gcp-terraform-sa-key.json"), null)
  project               = var.project_id
  billing_project       = var.project_id
  region                = var.region
  user_project_override = true
}

provider "google-beta" {
  credentials           = try(file("gcp-terraform-sa-key.json"), null)
  alias                 = "no_user_project_override"
  project               = var.project_id
  billing_project       = var.project_id
  region                = var.region
  user_project_override = false
}

resource "google_firebase_project" "default" {
  provider = google-beta
  project  = var.project_id
}

# FIXME: コメントアウトで一時的に409エラーの発生を抑えている。
# resource "google_app_engine_application" "default" {
#   provider      = google-beta.no_user_project_override
#   project       = google_firebase_project.default.project
#   location_id   = var.region
#   database_type = "CLOUD_FIRESTORE"

#   # TODO: Firestore追加時にコメントアウトを解除する。
#   #   depends_on = [
#   #     google_firestore_database.default
#   #   ]
# }

resource "google_firebase_web_app" "basic" {
  provider     = google-beta
  project      = var.project_id
  display_name = "YUMEMI PG Hackathon Team4 Web App"
}

resource "google_firebase_android_app" "basic" {
  provider     = google-beta
  project      = var.project_id
  display_name = "YUMEMI PG Hackathon Team4 Android App"
  package_name = "com.example.client"
}

resource "google_firebase_apple_app" "default" {
  provider     = google-beta
  project      = var.project_id
  display_name = "YUMEMI PG Hackathon Team4 iOS App"
  bundle_id    = "com.example.client"

  depends_on = [
    google_firebase_project.default,
  ]
}
