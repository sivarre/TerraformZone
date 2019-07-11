output "ec2-ip" {
  value = "${aws_instance.tf_ec2ubuntu.public_ip}"
}
