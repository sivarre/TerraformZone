data "aws_vpc" "default-vpc" {
    default = true
}

data "aws_subnet_ids" "default-subnets"{
    vpc_id =  "${data.aws_vpc.default-vpc.id}"
}


output "all-subnets-vpc" {
  value = "${data.aws_subnet_ids.default-subnets.ids}"
}

output "subnet-count" {
  value = "${length(data.aws_subnet_ids.default-subnets.ids)}"
}

output "subnet-count-all" {
  value = "${data.aws_subnet_ids.default-subnets.*.ids}"
}


/*
output "subnet-count-all-multi-array" {
  value = "${data.aws_subnet_ids.default-subnets.*.ids[0]}"
} */

output "subnet-count-0" {
  value = "${element(data.aws_subnet_ids.default-subnets.*.ids,3)}"
}

output "subnet-count-2" {
  value = "${tolist(data.aws_subnet_ids.default-subnets.ids)[3]}"
}
