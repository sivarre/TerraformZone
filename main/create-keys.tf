resource "aws_key_pair" "tf_key"{
    key_name = "newkey"
    public_key = "${file("siva.pub")}"
}
