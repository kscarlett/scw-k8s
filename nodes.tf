resource "scaleway_server" "node" {
  count               = "${var.nodes}"
  name                = "${terraform.workspace}-node-${count.index + 1}"
  image               = "${data.scaleway_image.xenial.id}"
  type                = "${var.server_type}"
  tags                = ["k8s", "k8s-worker", "${terraform.workspace}", "${terraform.workspace}-node"]
  dynamic_ip_required = true
  security_group      = "${scaleway_security_group.node_sec_group.id}"
}
