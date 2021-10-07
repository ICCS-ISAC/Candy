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

variable "candy_instance_name" {
  description = "The value to use for the Name tag of the EC2 instance"
  type        = string
  default     = "ValidatorNodeInstance"
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

variable "candy_ebs_name" {
  description = "The name of the EBS volume."
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

variable "candy_eip_client_ip_name" {
  description = "The name of the elastic IP for the client interface."
}

variable "candy_eip_node_ip_name" {
  description = "The name of the elastic IP for the node interface."
}

variable "candy_eni_client_name" {
  description = "The name of the client interface card."
}

variable "candy_eni_client_description" {
  description = "The description of the client interface card."
}

variable "candy_eni_client_ip" {
  description = "The private IP address to use for the client interface card."
}

variable "candy_eni_node_name" {
  description = "The name of the node interface card."
}

variable "candy_eni_node_description" {
  description = "The description of the node interface card."
}

variable "candy_eni_node_ip" {
  description = "The private IP address to use for the node interface card."
}

variable "candy_subnet_client_name" {
  description = "The name of the client subnet."
}

variable "candy_subnet_client_cidr_block" {
  description = "The cidr block to use for the client subnet."
}

variable "candy_sg_name" {
  description = "The name of the security group."
}

variable "candy_sg_tag_name" {
  description = "The name to use for the security group's tag."
}

variable "candy_sg_description" {
  description = "The description for the security group."
}


