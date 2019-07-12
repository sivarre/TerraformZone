#----- storage/main.tf


#To Generate Random ID
resource "random_id" "tf_bucket_id" {
     byte_length = 1
}


# To create a s3 bucket
resource "aws_s3_bucket" "tf_s3_bucket"{
  bucket = "${var.project_name}-${random_id.tf_bucket_id.dec}"
  force_destroy = true

  tags = {
    Name = "tf_bucket"
  }
}
