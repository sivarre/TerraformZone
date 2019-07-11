provider "aws" {

}

resource "aws_instance" "tf_nginx_instance" {
    ami = "ami-024a64a6685d05041"
    instance_type = "t2.micro"
    tags = {
        Name = "Nginx-Machine"
    }
    key_name = "${aws_key_pair.tf_key.key_name}"

    connection {
        user = "ubuntu"
        host = "${aws_instance.tf_nginx_instance.public_ip}"
        private_key = "${file("siva")}"
    }
    provisioner "remote-exec" {
        inline = [
            "sudo apt update -y",
            "sudo apt install nginx -y",
            "sudo service nginx start"
        ]
    }
}

resource "aws_key_pair" "tf_key"{
    key_name = "nginx-key"
    public_key = "${file("siva.pub")}"
}



output "tf_public_ip" {
  value = "${aws_instance.tf_nginx_instance.public_ip}"
}
