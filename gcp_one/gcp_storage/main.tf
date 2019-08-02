provider "google" {
  credentials = "${file("~/key.json")}"
  project = "svarre-storage-demo"
  #region = ""
}

variable "project_name"{
  default = "svarre-storage-demo-terraform"
}

resource "random_id" "tf_random_id" {
    byte_length = 2
}

resource "google_storage_bucket" "tf_bucket" {
    name = "${var.project_name}-${random_id.tf_random_id.dec}"
    force_destroy = true
    location = "asia-south1"
    storage_class = "REGIONAL"
}


output "bucket_name"{
  value = "${google_storage_bucket.tf_bucket.url}"
}
