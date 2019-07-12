# ------- root/outputs.tf


output "Random_ID"{
  value = "${module.m-storage.out_randome_id}"
}


output "Bucket_Name"{
  value = "${module.m-storage.out_bucket_name}"
}
