variable "var_count" {
  default = 2
}

resource "aws_instance" "web" {
  # ...
  ami = "ami-024a64a6685d05041"
  instance_type = "t2.micro"
  count = "${var.var_count}"

  # Tag the instance with a counter starting at 1, ie. web-001
  tags = {
    Name = "${format("web-%03d", count.index + 1)}"
  }
}