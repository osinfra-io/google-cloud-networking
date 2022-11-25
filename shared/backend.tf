terraform {
  backend "gcs" {
    prefix = "google-cloud-logging"
  }
}
