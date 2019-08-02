output "cidr_block" {
  value = "${data.aws_vpc.vpc.cidr_block}"
}


output "subnet_ids" {
  value = "${data.aws_subnet_ids.subnet.ids}"
}


output "Security_Group_Id"{
  value = "${aws_security_group.tf_sg_allow_all.id}"
}

output "Security_Group_ARN"{
  value = "${aws_security_group.tf_sg_allow_all.arn}"
}

output "Security_Group_Vpc_ID"{
  value = "${aws_security_group.tf_sg_allow_all.vpc_id}"
}

output "subnet-count-2" {
  value = "${tolist(data.aws_subnet_ids.subnet.ids)[1]}"
}

output "network_interface_id"{
  value = "${aws_network_interface.test.id}"
}


output "network_interface_private_ips"{
  value = "${aws_network_interface.test.private_ips}"
}

output "security_groups_forNetworkInterfaceCard"{
  value = "${aws_network_interface.test.security_groups}"
}

output "default_security_group_id_for_vpc"{
  value = "${data.aws_security_groups.dt_sg_groups.ids}"
}

output "hello"{
  value = "${aws_security_group.tf_sg_allow_all.id}"
}

output "default_security_group_id_for_vpc_1"{
  value = "${element(data.aws_security_groups.dt_sg_groups.ids, 0)}"
  #value = "element(${data.aws_security_groups.dt_sg_groups.ids, 0})"
}
