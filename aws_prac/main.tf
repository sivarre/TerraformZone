#-------Main file to use Module
provider "google" {
  credentials = "${file("account.json")}"
  project = "devopspractise-235014"
  region = "asia-south1"
}

module "m-instance1" {
  source = "./compute"
  var_instance_type = "t2.micro"
  var_ec2_tag_name = "Apache"
  var_public_key_name_ec2 = "${module.m-key-name.out_public_key_name}"
}

module "m-key-name" {
  source = "./key-name"
  var_public_key_name = "siva_key"
}


output "m-instance1-ip"{
  value = "${module.m-instance1.out_instance_ip}"
  #value = "${aws_instance.tf_aws_instance.public_ip}"
}

output "m-gcp-ip"{
  value = "${module.m-instance1.out_gcp_ip}"
}
