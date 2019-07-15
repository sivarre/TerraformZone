output "public_subnets"{
  value = "${aws_subnet.tf_public_subnet.*.id}"
}

output "Subnet_ips"{
  value = "${aws_subnet.tf_public_subnet.*.cidr_block}"
}
