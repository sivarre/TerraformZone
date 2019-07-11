resource "aws_instance" "tf_ec2ubuntu"{
    ami = "ami-024a64a6685d05041"
    instance_type = "t2.micro"
    tags = {
        Name = "ubuntu_server2"
        Env = "production"
    }
    key_name = "${aws_key_pair.tf_key.key_name}"
}

output "tf_public_ip" {
  value = "${aws_instance.tf_ec2ubuntu.public_ip}"
}






