#------ storage/outputs.tf

output "out_randome_id"{
  value = "${random_id.tf_bucket_id.dec}"
}

output "out_bucket_name"{
  value = "${aws_s3_bucket.tf_s3_bucket.id}"
}
