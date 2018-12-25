provider "scaleway" {
  region  = "${var.region}"
  version = "~>1.8"
}

resource "scaleway_server" "test_server" {
  name = "test_server"

  # Image: Ubuntu Xenial x86_64 in ams1
  image               = "4035ca92-5292-4c6e-aa17-759fbc32765e"
  type                = "${var.server_type}"
  tags                = ["terraform", "test"]
  dynamic_ip_required = true
  security_group      = "${scaleway_security_group.test_sec_group.id}"
}
