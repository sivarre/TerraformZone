terraform{
  backend "s3"{
    bucket = "vprofile-build-artifacts-siva"
    key = "siva-terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "sivvatest"
  }
  # vprofile-build-artifacts-siva

}
