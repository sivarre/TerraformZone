provider "aws" {
  region = "${var.aws_region}"
  #aws_region = "ap-south-1"
}

module "m-storage" {
  source = "./storage"
  project_name = "${var.project_name}"
}
