module "m-webserver" {
  source = "../module-ec2"
  ec2-tag-name = "Example-1"
  public-key-name-ec2 = "my-key"
  #public-key-name-ec2 = "${module.m-key-pair.my-key-name-output}"

}

module "m-webserver-1" {
  source = "../module-ec2"
  ec2-tag-name = "Example-2"
#  public-key-name-ec2 = "${module.m-key-pair.my-key-name-output}"
  public-key-name-ec2 = "my-key"
}

module "m-key-pair" {
  source = "../module-key-pair"
  public-key-name = "my-key"
}



output "m-ec2-public-ip-1" {
  value = "${module.m-webserver.ec2-ip}"
}


output "m-ec2-public-ip-2" {
  value = "${module.m-webserver-1.ec2-ip}"
}
