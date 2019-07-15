variable "vpc_id" {
  default = "vpc-ca37beb0"
}

/*
variable "count_def" {
  default = "3"
} */

data "aws_vpc" "vpc" {
  id = "${var.vpc_id}"
}

data "aws_subnet_ids" "subnet" {
  vpc_id = "${var.vpc_id}"
  tags = {
      tier = "Private"
  }
}

/*
data "aws_network_interfaces" "network_interfaces"{
}*/

locals {
  subnet_ids_string = join(",", data.aws_subnet_ids.subnet.ids)
  subnet_ids_list = split(",", local.subnet_ids_string)
}

resource "aws_network_interface" "test" {
  #count = "${length(data.aws_subnet_ids.subnet.ids)}"
  #count = "${length(data.aws_subnet_ids.subnet_list.ids)}"
  #subnet_id = "${element(data.aws_subnet_ids.subnet.ids, 0)}"
  #count = "${var.count_def}"
  #count = 1
  #subnet_id = local.subnet_ids_list[count.index]
  #count = 1
  #subnet_id = tolist("${element(data.aws_subnet_ids.subnet.ids, 1)}")
  subnet_id = "${tolist(data.aws_subnet_ids.subnet.id) [1]}"
  description = "Network Interface Card from Terraform"
  #private_ip = ["172.31.0.20"]
  tags = {
      Name = "Network-Card-Terraform" #${count.index + 1}
  }
}


resource "aws_network_interface_sg_attachment" "mysgattachment" {
    #count = "${var.count_def}"
    #count = 1
    security_group_id = "${aws_security_group.tf_sg_allow_all.id}"
    network_interface_id = "${aws_network_interface.test.id}"
}

resource "aws_security_group" "tf_sg_allow_all" {
    name = "My_Terraform_Sg"
    description = "Demo Security group created by Terraform Script"
    ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self = true
    }
    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name = "My_Terraform_Sg"
    }
}

# -----------------------------------outputs

output "cidr_block" {
  value = "${data.aws_vpc.vpc.cidr_block}"
}

output "subnet_ids" {
  value = "${data.aws_subnet_ids.subnet.ids}"
}

output "Private_ips" {
  value = "${aws_network_interface.test.*.private_ips}"
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

output "network_interfaces"{
  value = "${aws_network_interface.test.id}"
}
