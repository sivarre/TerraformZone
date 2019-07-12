data "aws_availability_zones" "example" {
  #state = "available"
}


data "aws_instance" "dt_instance" {
  instance_id = "${aws_instance.re_instance.id}"
}

resource "aws_instance" "re_instance" {
  ami = "ami-024a64a6685d05041"
  instance_type = "t2.micro"
}


/*
output "out_avai" {
  value = "${data.aws_availability_zones.example.names}"
}
*/

output "availability_zone" {
  value = "${data.aws_instance.dt_instance.availability_zone}"
}
