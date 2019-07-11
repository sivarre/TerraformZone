output "out_instance_ip"{
  value = "${aws_instance.tf_aws_instance.public_ip}"
}


output "out_gcp_ip"{
  value = "${google_compute_address.static.address}"
}
