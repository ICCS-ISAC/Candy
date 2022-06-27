#-------------------------------------------------------------------------------
# Global variables
#-------------------------------------------------------------------------------

variable "candy_instance_count" {
  description = "The number of instances to create."
  default = 1
}

variable "candy_instance_name" {
  description = "The value to use for the Name tag of the EC2 instance"
  default = "test-bc"
}

variable "candy_application_name" {
  description = "Name of application"
  default = "candy"
}

variable "candy_environment" {
  description = "Environnement"
  default = "test"
}

variable "candy_use_elastic_ips" {
  description = "Flag to indicate whether or not to provision the instances with elastic IPs."
  type = bool
  default = true
}

######################

variable "location" {
  description = "The Resource location"
  default     = "canadacentral"
}

# ssh public_key
data "local_file" "public_ssh_key" {
  filename = "./candy-test-key.pub"
}
