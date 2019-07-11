provider "docker" {

}

resource "docker_image" "tf_image" {
    name = "${lookup(var.var_image , var.env)}"
}

resource "docker_container" "tf_container" {
    name = "${lookup(var.var_cont_name,var.env)}"
    image = "${docker_image.tf_image.latest}"
    ports {
      internal = "${var.var_int_port}"
      external = "${lookup(var.var_ext_port, var.env)}"
    }
}
