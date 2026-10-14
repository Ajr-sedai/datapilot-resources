resource "google_dataflow_job" "sample_streaming_pubsub_to_gcs" {
  name                  = "sample-streaming-pubsub-to-gcs"
  region                = "us-central1"
  zone                  = "us-central1-c"
  template_gcs_path     = "gs://dataflow-templates-us-central1/latest/Cloud_PubSub_to_GCS_Text"
  temp_gcs_location     = "gs://pooja-dataflow-samples-dev-gcp-394616/temp"
  machine_type          = "e2-medium"
  max_workers           = 1
  network               = "default"
  service_account_email = "817495521130-compute@developer.gserviceaccount.com"
  on_delete             = "cancel"

  parameters = {
    inputTopic           = var.input_topic
    outputDirectory      = var.output_directory
    outputFilenamePrefix = "output"
    windowDuration       = "5m"
  }
}
