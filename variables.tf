variable "region" {
  default     = "par1"
  description = "Values: par1 ams1"
}

variable "node_server_type" {
  default     = "START1-S"
  description = "Server type to use for the nodes - for a list of available options:"
}

variable "master_server_type" {
  default     = "START1-S"
  description = "Server type to use for the master - for a list of available options:"
}

variable "ssh_ip" {
  type        = "list"
  default     = ["0.0.0.0/0"]
  description = "IP addresses to be allowed access to SSH"
}

variable "nodes" {
  default     = 3
  description = "The amount of nodes to be started"
}
