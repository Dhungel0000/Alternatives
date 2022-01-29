resource "google_service_account" "service_account" {
  account_id   = "adhungelfunctioninvoker"
  display_name = "Cloud Function Invoker Service Account"
  project      = var.project_id
}