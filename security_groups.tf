resource "scaleway_security_group" "node_sec_group" {
  name                    = "${terraform.workspace}-node"
  description             = "Kubernetes nodes for ${terraform.workspace} created by Terraform"
  stateful                = true
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"
}

resource "scaleway_security_group_rule" "ssh_allow_node" {
  count          = "${length(var.ssh_ip)}"
  security_group = "${scaleway_security_group.node_sec_group.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "${element(var.ssh_ip, count.index)}"
  protocol  = "TCP"
  port      = 22
}

resource "scaleway_security_group" "master_sec_group" {
  name                    = "${terraform.workspace}-master"
  description             = "Kubernetes master for ${terraform.workspace} created by Terraform"
  stateful                = true
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"
}

resource "scaleway_security_group_rule" "ssh_allow_master" {
  count          = "${length(var.ssh_ip)}"
  security_group = "${scaleway_security_group.master_sec_group.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "${element(var.ssh_ip, count.index)}"
  protocol  = "TCP"
  port      = 22
}

resource "scaleway_security_group_rule" "management_master" {
  count          = "${length(var.ssh_ip)}"
  security_group = "${scaleway_security_group.master_sec_group.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "${element(var.ssh_ip, count.index)}"
  protocol  = "TCP"
  port      = 6443
}

resource "scaleway_security_group_rule" "dashboard_master" {
  count          = "${length(var.ssh_ip)}"
  security_group = "${scaleway_security_group.master_sec_group.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "${element(var.ssh_ip, count.index)}"
  protocol  = "TCP"
  port      = 8888
}
