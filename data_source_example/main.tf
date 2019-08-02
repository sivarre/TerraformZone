data "aws_availability_zones" "example" {
  #state = "available"
}

/*
data "aws_instance" "dt_instance" {
  #instance_id = "${aws_instance.re_instance.id}"
}
*/

/*
resource "aws_instance" "re_instance" {
  ami = "ami-024a64a6685d05041"
  instance_type = "t2.micro"
}
*/

data "aws_ami" "ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = ["amazon"]
}

data "aws_caller_identity" "current" {}


output "account_id" {
  value = "${data.aws_caller_identity.current.account_id}"
}


output "ami_options"{
  value = "${data.aws_ami.ami.image_id}"
}


/*
output "out_avai" {
  value = "${data.aws_availability_zones.example.names}"
}
*/

output "availability_zone" {
  #value = "${data.aws_instance.dt_instance.availability_zone}"
  value = "${data.aws_availability_zones.example.names}"
}
