resource "scaleway_security_group" "node_sec_group" {
  name                    = "${terraform.workspace}-node"
  description             = "Kubernetes nodes for ${terraform.workspace} created by Terraform"
  stateful                = true
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"
}

resource "scaleway_security_group_rule" "ssh_allow" {
  count          = "${length(var.ssh_ip)}"
  security_group = "${scaleway_security_group.node_sec_group.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "${element(var.ssh_ip, count.index)}"
  protocol  = "TCP"
  port      = 22
}
