data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = var.candy_ami_owners

  filter {
    name   = "name"
    values = var.candy_ami_filter_name
  }

  filter {
    name   = "root-device-type"
    values = var.candy_ami_filter_root_device_type
  }

  filter {
    name   = "virtualization-type"
    values = var.candy_ami_filter_virtualization_type
  }
}

data "aws_vpc" "default" {
  # Allows dynamic lookup of information about the default VPC.
  # Specifically it's ID
  default = true
}

data "aws_iam_role" "ssm_role" {
  name = "AmazonSSMRoleForInstancesQuickSetup"
}
