#-------------------------------------------------------------------------------
# Global variables
#-------------------------------------------------------------------------------

variable "candy_region" {
  description = "a specific AWS region"
}

variable "candy_application" {
  description = "Name of application"
}

variable "candy_profile" {
  description = "Configuration profile of AWS"
}

variable "candy_environment" {
  description = "Environnement"
}

variable "candy_availability_zone" {
  description = "Availability zone"
}

variable "candy_eip_client_allocation_id" {
  description = "The allocation id of address to use for the client interface card."
}

variable "candy_eip_node_allocation_id" {
  description = "The allocation id of address to use for the node interface card."
}

variable "candy_tg_forwarding_port_client" {
  type = map(number)
  description = "The value to use for the port and protocol of client interface."
}

variable "candy_elb_listener_port_client" {
  type = map(number)
  description = "The port number the load balancer listen."
}

variable "candy_elb_client_name" {
  description = "The value to use for the laod balancer name of the client interface."
}

variable "candy_tg_client_name" {
  description = "The value to use for the target groupe name of the client interface."
}

variable "candy_elb_node_name" {
  description = "The value to use for the laod balancer name of the node interface."
}

variable "candy_tg_node_name" {
  description = "The value to use for the target groupe name of the node interface."
}

variable "candy_tg_port_node" {
  description = "The value to use for the port of node interface."
}

variable "candy_elb_listener_port_node" {
  description = "The port number the load balancer listen."
}

variable "candy_eni_firewall_ip" {
  description = "The private IP address that use it in the client interface card of firewall ec2"
}