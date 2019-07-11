resource "aws_key_pair" "tf_key"{
    key_name = "${var.public-key-name}"
    #public_key = "${file("siva.pub")}"
    public_key = "${file("siva.pub")}"
}
