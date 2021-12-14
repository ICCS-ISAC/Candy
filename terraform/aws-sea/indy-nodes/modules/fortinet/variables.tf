# ===================================================
# Global variables
# ---------------------------------------------------

variable "aws_application" {
  description = "Name of application"
}

variable "aws_environment" {
  description = "Environnement"
}

# ===================================================

# ===================================================
# Global variables for fortinet module
# ---------------------------------------------------

variable "fortios_hostname" {
  description = "The public ip or hostname for the instance ec2 of the firewall"
}

variable "fortios_token" {
  description = "The token of the service account in the fortinet"
}

variable "fortios_vip" {
  type = map
  description = "The firewall vip"
}

variable "eni_firewall_ip" {
  description = "The private IP address that use it in the client interface card of firewall instance."
}

variable "eni_client_ip" {
  description = "The private IP address to use for the client interface card."
}

variable "eni_node_ip" {
  description = "The private IP address to use for the node interface card."
}

variable "elb_node_ip" {
  description = "The private IP address to use for the node interface card."
}

variable "tg_forwarding_port_client" {
  description = "The value to use for the port and protocol of client interface."
}

variable "elb_listener_port_client" {
  description = "The port number the load balancer listen."
}

variable "tg_port_node" {
  description = "The value to use for the port of node interface."
}

variable "elb_listener_port_node" {
  description = "The port number the load balancer listen."
}

variable "eip_client_allocation_id" {
  description = "The allocation id of elastic IP to use for the client interface card."
}

variable "eip_node_allocation_id" {
  description = "The allocation id of elastic IP to use for the node interface card."
}

variable "aws_instance_name" {
  description = "The value to use for the Name tag of the EC2 instance"
  type        = string
  default     = "ValidatorNodeInstance"
}

# ===================================================


