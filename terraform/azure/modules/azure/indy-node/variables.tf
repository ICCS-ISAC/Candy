variable "instance_name" {
  description = "The value to use for the Name tag of the EC2 instance"
}

variable "application_name" {
  description = "The name of the application."
}

variable "environment" {
  description = "The name of the environment."
}

variable "resource_group" {
  description = "The resouce group in which to create the instance."
}

# ToDo:
#   - Align AWS and Azure variable names
#   - AWS Name: ec2_instance_type
variable "instance_size" {
  description = "The size of VM to use for the instance."
  default     = "Standard_D2as_v4"
}

variable "os_disk" {
  description = "The os_disk settings for the VM.."
  type = object({
    caching              = string
    storage_account_type = string
  })
  default = {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }
}

variable "source_image_reference" {
  description = "The source image reference to use from the instance."
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
}

variable "storage_account" {
  description = "Storage account settings for the instance."
  type = object({
    account_tier             = string
    account_replication_type = string
  })
  default = {
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

variable "admin_username" {
  description = "The username to use for the admin account.  This is also used for the ssh username."
  default     = "validatornode"
}

variable "public_ssh_key" {
  description = "The public SSH key to associate with the instance."
}

variable "ssh_source_address" {
  description = "The source IP address for SSH connections, in CIDR notation."
}

variable "default_tags" {
  description = "The default tags to apply to all resources."
}

variable "vnet_address_range" {
  description = "The CIDR address range to use for the virtual network of a node."
  default     = ["10.0.0.0/16"]
}

# ToDo:
#   - Align AWS and Azure variable names
#   - AWS Name: subnet_client_cidr_block
variable "client_subnet_range" {
  description = "The CIDR address range to use for the client subnet."
  default     = ["10.0.1.0/24"]
}

# ToDo:
#   - Align AWS and Azure variable names
#   - AWS Name: subnet_node_cidr_block
variable "node_subnet_range" {
  description = "The CIDR address range to use for the node subnet."
  default     = ["10.0.2.0/24"]
}

variable "private_client_ip" {
  description = "The internal IP address for the client NIC.  The address must be within the client subnet range."
  default     = "10.0.1.5"
}

variable "client_port" {
  description = "The port, within the indy range of 9700 to 9799, on which the client interface will listen."
  default     = "9702"
}

variable "private_node_ip" {
  description = "The internal IP address for the node NIC.  The address must be within the node subnet range."
  default     = "10.0.2.5"
}

variable "node_port" {
  description = "The port, within the indy range of 9700 to 9799, on which the node interface will listen."
  default     = "9701"
}