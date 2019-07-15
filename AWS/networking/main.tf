
data "aws_availability_zones" "available"{
}

# Creating a VPC
resource "aws_vpc" "tf_vpc" {
    cidr_block = "${var.vpc_cidr}"
    tags = {
      Name = "tf_vpc"
    }
}

#Creating an IGW and assigining it to above VPC
resource "aws_internet_gateway" "tf_igw" {
    vpc_id = "${aws_vpc.tf_vpc.id}"

    tags = {
    Name = "tf_igw"
    }
}

# Creating an route table and making that gateway through IGW
resource "aws_route_table" "tf_public_rt" {
    vpc_id = "${aws_vpc.tf_vpc.id}"
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.tf_igw.id}"
    }

    tags = {
      Name = "Public_route_table"
    }
}

#
resource "aws_default_route_table" "tf_private_rt" {
    default_route_table_id = "${aws_vpc.tf_vpc.default_route_table_id}"

    tags = {
      Name = "Private Route Table"
    }
}

#subnets
resource "aws_subnet" "tf_public_subnet" {
    count = 2
    vpc_id = "${aws_vpc.tf_vpc.id}"
    cidr_block = "${var.public_cidrs[count.index]}"
    availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
    tags = {
      Name = "Public_Subnet_${count.index + 1}"
    }
}
