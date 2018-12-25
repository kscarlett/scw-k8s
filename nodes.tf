resource "scaleway_server" "node" {
  count               = "${var.nodes}"
  name                = "${terraform.workspace}-node-${count.index + 1}"
  image               = "${data.scaleway_image.xenial.id}"
  type                = "${var.server_type}"
  tags                = ["${terraform.workspace}-node", "${terraform.workspace}", "k8s-worker", "k8s"]
  dynamic_ip_required = true
  security_group      = "${scaleway_security_group.node_sec_group.id}"
}
