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


variable "candy_ami_owners" {
  description = "List of AMI owners"
}

variable "candy_ami_filter_name" {
  description = "Filter by name"
}

variable "candy_ami_filter_virtualization_type" {
  description = "Filter by virtualization type"
}

variable "candy_ec2_instance_type" {
  description = "Type of instance ec2"
}

variable "candy_ec2_vpc_security_group_ids" {
  description = "Security Group "
}

variable "candy_ec2_subnet_id" {
  description = "Subnet id"
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