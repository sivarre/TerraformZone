provider "aws" {

}

resource "aws_instance" "tf_aws_instance" {
    ami = "ami-024a64a6685d05041"
    instance_type = "t2.micro"
    tags = {
      Name = "Apache Server"
      Env = "${var.env_apache_server}"
    }
    key_name = "${var.var_key_name}"
    user_data = "${data.template_file.userdata.rendered}"

    provisioner "file" {
      #source = "${var.env_apache_server}/index.html"
      source = "dev/index.html"
      destination = "/var/www/html"

      connection {
       type     = "ssh"
       user     = "ubuntu"
       private_key = "${file("tf_nvirginia.pem")}"
       host = self.public_ip
     }

    }

}

data "template_file" "userdata"{
  template = "${file("${path.module}/templates/userdata.tpl")}"
  #template = "${file("./templates/userdata.tpl")}"
}
