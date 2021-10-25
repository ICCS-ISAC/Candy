#-------------------------------------------------------------------------------
# Global variables
#-------------------------------------------------------------------------------

variable "aws_region" {
  description = "a specific AWS region"
}

variable "aws_application" {
  description = "Name of application"
}

variable "aws_profile" {
  description = "Configuration profile of AWS"
}

variable "aws_environment" {
  description = "Environnement"
}

variable "aws_availability_zone" {
  description = "Availability zone"
}

variable "eip_client_allocation_id" {
  description = "The allocation id of elastic IP to use for the client interface card."
}

variable "eip_node_allocation_id" {
  description = "The allocation id of elastic IP to use for the node interface card."
}

variable "tg_forwarding_port_client" {
  description = "The value to use for the port and protocol of client interface."
}

variable "elb_listener_port_client" {
  description = "The port number the load balancer listen."
}

variable "elb_client_name" {
  description = "The value to use for the laod balancer name of the client interface."
}

variable "tg_client_name" {
  description = "The value to use for the target groupe name of the client interface."
}

variable "elb_node_name" {
  description = "The value to use for the laod balancer name of the node interface."
}

variable "tg_node_name" {
  description = "The value to use for the target groupe name of the node interface."
}

variable "tg_port_node" {
  description = "The value to use for the port of node interface."
}

variable "elb_listener_port_node" {
  description = "The port number the load balancer listen."
}

variable "eni_firewall_ip" {
  description = "The private IP address that use it in the client interface card of firewall ec2"
}
