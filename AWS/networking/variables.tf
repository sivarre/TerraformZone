#------- neworking/variables.tf

variable "vpc_cidr" {
  default = "10.123.0.0/16"
}

variable "public_cidrs" {
  type = "list"
}
