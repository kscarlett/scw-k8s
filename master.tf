resource "scaleway_ip" "master_ip" {
  count = 1
}

resource "scaleway_server" "master" {
  count          = 1
  name           = "${terraform.workspace}-master"
  image          = "${data.scaleway_image.xenial.id}"
  type           = "${var.master_server_type}"
  tags           = ["${terraform.workspace}-master", "${terraform.workspace}", "k8s-master", "k8s"]
  public_ip      = "${element(scaleway_ip.master_ip.*.ip, count.index)}"
  security_group = "${scaleway_security_group.master_sec_group.id}"
}
