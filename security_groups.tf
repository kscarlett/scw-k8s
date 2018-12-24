resource "scaleway_security_group" "test_sec_group" {
  name                    = "test"
  description             = "Terraform test security group"
  stateful                = true
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"
}

resource "scaleway_security_group_rule" "ssh_allow" {
  count          = "${length(var.ssh_ip)}"
  security_group = "${scaleway_security_group.test_sec_group.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "${element(var.ssh_ip, count.index)}"
  protocol  = "TCP"
  port      = 22
}
