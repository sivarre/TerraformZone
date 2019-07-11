resource "random_id" "tf_bucket_id" {
     byte_length = 1
}

resource "aws_s3_bucket" "tf_s3_bucket"{
  bucket = "${"testproject"}-${random_id.tf_bucket_id.dec}"
  force_destroy = true

  tags = {
    Name = "tf_bucket"
  }
}


output "out_randome_id"{
  value = "${random_id.tf_bucket_id.dec}"
}

output "out_bucket_name"{
  value = "${aws_s3_bucket.tf_s3_bucket.id}"
}
