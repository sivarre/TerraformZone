resource "aws_instance" "tf_ec2ubuntu"{
    ami = "ami-024a64a6685d05041"
    instance_type = "t2.micro"
    tags = {
        Name = "${var.ec2-tag-name}"
        Env = "production"
    }
     key_name = "${var.public-key-name-ec2}"
}


output "tf_public_ip" {
  value = "${aws_instance.tf_ec2ubuntu.public_ip}"
}
