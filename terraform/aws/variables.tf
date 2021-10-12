#-------------------------------------------------------------------------------
# Global variables
#-------------------------------------------------------------------------------

variable "candy_instance_count" {
  description = "The number of instances to create."
  default = 1
}

variable "candy_use_elastic_ips" {
  description = "Flag to indicate whether or not to provision the instances with elastic IPs."
  type = bool
  default = true
}

variable "candy_region" {
  description = "a specific AWS region"
}

variable "candy_application_name" {
  description = "Name of application"
}

variable "assume_role" {
  description = "The AWS IAM role to assume to access a given environment."
}

variable "candy_environment" {
  description = "Environnement"
}

variable "candy_instance_name" {
  description = "The value to use for the Name tag of the EC2 instance"
}

variable "candy_ami_owners" {
  description = "List of AMI owners"
}

variable "candy_ami_filter_name" {
  description = "Filter by name"
}

variable "candy_ami_filter_root_device_type" {
  description = "Filter by Root Device Type"
}

variable "candy_ami_filter_virtualization_type" {
  description = "Filter by virtualization type"
}

variable "candy_ec2_instance_type" {
  description = "Type of instance ec2"
}

variable "candy_ebs_volume_size" {
  description = "EBS volume size"
}

variable "candy_ebs_volume_type" {
  description = "EBS volume type"
}

variable "candy_ebs_encrypted" {
  description = "EBS is encrypted"
}

variable "candy_ebs_kms_key_id" {
  description = "KMS key used to encrypt/decrypt EBS"
}

variable "candy_ebs_delete_on_termination" {
  description = "EBS delete on termination"
}

variable "candy_subnet_cidr_block_prefix" {
  description = "The prefix for the subnet CIDR blocks."
}

variable "candy_subnet_cidr_starting_address" {
  description = "The starting address for the subnet CIDR blocks."
}

variable "candy_sg_description" {
  description = "The description for the security group."
}

