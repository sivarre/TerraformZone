provider "aws" {

}

variable "instance_count" {
  default = "3"
}

# Instance Creation
resource "aws_instance" "tf_instance_name" {
    ami = "ami-024a64a6685d05041"
    #ami = "ami-06832d84cd1dbb448"
    instance_type = "t2.micro"
    key_name = "${var.var_key_name}"
    count         = "${var.instance_count}"
    tags = {
      Name = "ngnix-machine-qt"
    }
    #vpc_security_group_ids = ["${aws_security_group.tf_sg.id}"]
    security_groups = ["${aws_security_group.tf_sg_nginx.name}","${aws_security_group.tf_sg_ssh.name}"]
  }

data "aws_instance" "foo"{
  instance_id = "${aws_instance.tf_instance_name.id}"

}



#Security group for AWS
resource "aws_security_group" "tf_sg_nginx" {
    name = "nginx_sg"
    description = "This Security group allows port 80 and 22 from 0.0.0.0/0"
    ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "Nginx-Terraform-SG"
    }

}

resource "aws_security_group" "tf_sg_ssh" {
    name = "ssh_sg"
    description = "This allows port 22 from my ip address"
    ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["110.224.142.226/32"]
    }

    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "ssh-Terraform-SG"
    }
}



output "ip_Address_of"{
  value = "${aws_instance.tf_instance_name.public_ip}"
}

output "instance_id_out"{
  value = "${aws_instance.tf_instance_name.id}"
}

/*output "availability_zone_output"{
  value = "${data.aws_instance.foo.availability_zone}"
} */
