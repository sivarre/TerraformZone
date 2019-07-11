provider "google" {
  credentials = "${file("account.json")}"
  project = "devopspractise-235014"
  region = "asia-south1"
}

resource "google_compute_address" "static" {
  name = "ipv4-address"
}

resource "google_compute_instance" "tf_gcp_instance" {
  name = "terraforminstance"
  machine_type = "n1-standard-1"
  zone = "asia-south1-a"
  boot_disk {
      initialize_params {
          image = "debian-cloud/debian-9"
      }
  }
  network_interface {
      network = "default"

      access_config {
          //Ephemeral IP
         # nat_ip = "${google_compute_address.static.address}"
      }
  }
}





