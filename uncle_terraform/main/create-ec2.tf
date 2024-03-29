provider "aws" {
    access_key = ""
    secret_key = ""
    region = "us-east-1"

}

resource "aws_instance" "Example"{
    ami = "ami-024a64a6685d05041"
    instance_type = "t2.micro"
    tags = {
        Name =  "MyMachine1"
    }
    key_name = "${aws_key_pair.mykey.key_name}"
    
}

resource "aws_key_pair" "mykey"{
    key_name = "mykey1"
    public_key = "${file("siva.pub")}"
}
