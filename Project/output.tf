output "vpc_id"{
  value = "${aws_vpc.tf_vpc.id}"
}

output "availability_zones_list"{
  value = "${data.aws_availability_zones.dt_azs.*.names}"
}

output "subnet_ids"{
  value = "${aws_subnet.tf_public_subnet1.*.id}"
}

output "public_route_table_id"{
  value = "${aws_route_table.tf_public_route.id}"
}
