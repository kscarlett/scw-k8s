resource "scaleway_ip" "node_ip" {
  count = "${var.nodes}"
}

resource "scaleway_server" "node" {
  count          = "${var.nodes}"
  name           = "${terraform.workspace}-node-${count.index + 1}"
  image          = "${data.scaleway_image.xenial.id}"
  type           = "${var.node_server_type}"
  tags           = ["${terraform.workspace}-node", "${terraform.workspace}", "k8s-worker", "k8s"]
  public_ip      = "${element(scaleway_ip.node_ip.*.ip, count.index)}"
  security_group = "${scaleway_security_group.node_sec_group.id}"
}
