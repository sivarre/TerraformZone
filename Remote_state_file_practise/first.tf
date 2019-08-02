variable "var_count" {
  default = 2
}

data "aws_ami" "example"{
  most_recent = true
  owners = ["self"]
  filter {
    name = "name"
    values = ["myimage"]
  }
}

data "aws_availability_zones" "azs"{
}

resource "aws_instance" "web" {
  # ...
  ami = "ami-024a64a6685d05041"
#  ami = "ami-0273d3782a80120cb" # my image AMI with apache2 installed
  instance_type = "t2.micro"
  count = "${var.var_count}"

  # Tag the instance with a counter starting at 1, ie. web-001
  tags = {
    #Name = "${format("web-%03d", count.index + 1)}"
    Name = "laptop- ${terraform.workspace}-${count.index}"
  }

  availability_zone = "${data.aws_availability_zones.azs.names[count.index]}"
}


output "availebility_zones_list"{
  value = "${join(", ", data.aws_availability_zones.azs.names)}"
}

output "myimage_id"{
  value = "${data.aws_ami.example.image_id}"
}
