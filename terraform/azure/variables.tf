#-------------------------------------------------------------------------------
# Global variables
#-------------------------------------------------------------------------------

variable "candy_instance_count" {
  description = "The number of instances to create."
  default = 1
}

variable "candy_region" {
  description = "A specific Azure region"
}

variable "candy_application_name" {
  description = "Name of application"
}

variable "candy_environment" {
  description = "Environnement"
}

variable "candy_instance_name" {
  description = "The value to use for the Name tag of the EC2 instance"
}

variable "candy_instance_size" {
  description = "The size of VM to use for the instance."
}

variable "candy_os_disk" {
  description = "The os_disk settings for the VM.."
  type = object({
    caching = string
    storage_account_type     = string
  })
}

variable "candy_source_image_reference" {
  description = "The source image reference to use from the instance."
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "candy_storage_account" {
  description = "Storage account settings for the instance."
  type = object({
    account_tier             = string
    account_replication_type = string
  })
}

variable "candy_admin_username" {
  description = "The username to use for the admin account.  This is also used for the ssh username."
}

variable "candy_public_ssh_key" {
  description = "The public ssh key to register with the servers for use with Ansible."
}

variable "candy_ssh_source_address" {
  description = "The source IP address for Ansible SSH connections, in CIDR notation."
}

variable "candy_vnet_address_range" {
  description = "The CIDR address range to use for the virtual network of a node."
}

variable "candy_client_subnet_range" {
  description = "The CIDR address range to use for the client subnet."
}

variable "candy_node_subnet_range" {
  description = "The CIDR address range to use for the node subnet."
}

variable "candy_private_client_ip" {
  description = "The internal IP address for the client NIC.  The address must be within the client subnet range."
}

variable "candy_client_port" {
  description = "The port, within the indy range of 9700 to 9799, on which the client interface will listen."
}

variable "candy_private_node_ip" {
  description = "The internal IP address for the node NIC.  The address must be within the node subnet range."
}

variable "candy_node_port" {
  description = "The port, within the indy range of 9700 to 9799, on which the node interface will listen."
}