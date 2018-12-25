output "node_public_ip" {
  value = "${concat(scaleway_server.test_server.*.name, scaleway_server.test_server.*.public_ip)}"
}
