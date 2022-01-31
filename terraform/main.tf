resource "google_storage_bucket" "bucket" {
  name     = "adhungel-cloud-function-bucket"
  location = var.region
  project  = var.project_id
}

data "archive_file" "src" {
  type        = "zip"
  source_dir  = "${path.root}/../src"
  output_path = "${path.root}/../generated/src.zip"
}

resource "google_storage_bucket_object" "archive" {
  name   = "${data.archive_file.src.output_md5}.zip"
  bucket = google_storage_bucket.bucket.name
  source = "${path.root}/../generated/src.zip"
}

resource "google_cloudfunctions_function" "function" {
  name        = "hellogoogle"
  description = "Scheduled example"
  runtime     = "java11"
  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http          = true
  entry_point           = "HelloGoogle"
}

resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = google_service_account.service_account.email
}