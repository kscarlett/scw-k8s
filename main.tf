provider "scaleway" {
  region  = "${var.region}"
  version = "~>1.8"
}

resource "scaleway_server" "test_server" {
  name                = "test_server"
  image               = "${data.scaleway_image.xenial.id}"
  type                = "${var.server_type}"
  tags                = ["terraform", "test"]
  dynamic_ip_required = true
  security_group      = "${scaleway_security_group.test_sec_group.id}"
}
