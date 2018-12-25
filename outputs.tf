output "nodes_public_ip" {
  value = "${concat(scaleway_server.node.*.name, scaleway_server.node.*.public_ip)}"
}
