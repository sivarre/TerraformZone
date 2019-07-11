variable "content_enter" {
  default = "Hello from Dell Laptop"
}
variable "filename_enter" {
  default = "siva"
}



resource "local_file" "tf_first_file" {
  #content = "Hello first terraform script"
  #path = "E:\\Practise\\Terraform_Practise\\name.txt"
  #filename = "name.txt"
  content = "${var.content_enter}"
  filename = "${var.filename_enter}"
}
