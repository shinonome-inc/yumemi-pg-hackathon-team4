variable "project_id" {}
variable "region" {}

provider "google-beta" {
  credentials           = try(file("gcp-terraform-sa-key.json"), null)
  project               = var.project_id
  billing_project       = var.project_id
  region                = var.region
  user_project_override = true
}

resource "google_identity_platform_config" "default" {
  provider = google-beta
  project  = var.project_id
}

resource "google_identity_platform_project_default_config" "default" {
  provider = google-beta
  project  = var.project_id
  sign_in {
    allow_duplicate_emails = true
    anonymous {
      enabled = true
    }
    email {
      enabled           = true
      password_required = false
    }
    phone_number {
      enabled = true
      test_phone_numbers = {
        "+11231231234" = "000000"
      }
    }
    // TODO: Google認証の設定はコンソールで行なっているので、Terraformに置き換える。
  }
  depends_on = [google_identity_platform_config.default]
}
