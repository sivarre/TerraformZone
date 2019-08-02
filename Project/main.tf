
#Data for getting avaialbilit zones in a region where we are runnin this script
data "aws_availability_zones" "dt_azs"{

}
# Creating an VPC
resource "aws_vpc" "tf_vpc" {
    cidr_block = "${var.var_vpc_subnet}"
    tags = {
      Name = "terraform_vpc"
    }
}

#Creating an IGW and assigning it to our VPC
resource "aws_internet_gateway" "tf_igw" {
    vpc_id = "${aws_vpc.tf_vpc.id}"

    tags = {
      Name = "terraform_igw"
    }
}

#Creating Public subnets based on the cidr count
resource "aws_subnet" "tf_public_subnet1" {
    count = "${length(var.var_subnet_cidr)}"
    vpc_id = "${aws_vpc.tf_vpc.id}"
    #vpc_id = "${var.var_subnet_cidr.}"
    #cidr_block = [var.var_subnet_cidr[count.index]]
    cidr_block = "${var.var_subnet_cidr[count.index]}"
    availability_zone = "${data.aws_availability_zones.dt_azs.names[count.index]}"
    tags = {
      Name = "Public_subnet ${count.index + 1}"
    }
    map_public_ip_on_launch = true
}


#Creating an route table and assigning 0.0.0.0/0 routes to it
resource "aws_route_table" "tf_public_route" {
    vpc_id = "${aws_vpc.tf_vpc.id}"
    route {
      cidr_block = "${var.public_route_cidr}"
      gateway_id = "${aws_internet_gateway.tf_igw.id}"
    }
    tags = {
      Name = "Public_Route_Table"
    }
}

#Naming our default route table which is created during VPC creation
resource "aws_default_route_table" "tf_default_rt" {
    default_route_table_id = "${aws_vpc.tf_vpc.default_route_table_id}"
    tags = {
      Name = "Private_Route_Table"
    }
}

#Associating public sibnets created abouve with public route table
resource "aws_route_table_association" "tf_public_route_assoc" {
    #count = "${length(aws_subnet.tf_public_subnet1.id)}"
    count = "${length(var.var_subnet_cidr)}"
    subnet_id = "${element(aws_subnet.tf_public_subnet1.*.id, count.index)}"
    route_table_id = "${aws_route_table.tf_public_route.id}"
}
