resource "aws_instance" "tf_aws_instance" {
    ami = "ami-024a64a6685d05041"
    instance_type = "${var.var_instance_type}"
    key_name = "${var.var_public_key_name_ec2}"
    tags = {
      Name = "${var.var_ec2_tag_name}"
    }
}


#-----------------GCP-----------------------------


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
         nat_ip = "${google_compute_address.static.address}"
      }
  }
}
