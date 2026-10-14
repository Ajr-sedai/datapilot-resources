resource "google_storage_bucket" "cost_billing_reports" {
  name                        = "cost_billing_reports"
  location                    = "US"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true

  hierarchical_namespace {
    enabled = true
  }

  versioning {
    enabled = false
  }
}

resource "google_storage_bucket" "dataflowout" {
  name          = "dataflowout"
  location      = "US"
  storage_class = "STANDARD"

  versioning {
    enabled = false
  }
}
