resource "google_cloud_scheduler_job" "job" {
  name             = "cloudfunctionscheduler"
  description      = "Trigger the ${google_cloudfunctions_function.function.name} Cloud Function every 10 mins."
  schedule         = "*/10 * * * *" # Every 10 mins
  time_zone        = "Europe/Dublin"
  attempt_deadline = "320s"

  http_target {
    http_method = "GET"
    uri         = google_cloudfunctions_function.function.https_trigger_url

    oidc_token {
      service_account_email = google_service_account.service_account.email
    }
  }
}