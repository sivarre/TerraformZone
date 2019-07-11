provider "aws" {

}



resource "aws_key_pair" "tf_key_pair" {
    key_name = "${var.var_public_key_name}"
    public_key = "${file("siva.pub")}"
}
