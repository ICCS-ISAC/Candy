# ===================================================
# Filter the image you want to use for the ec2 instance
# ---------------------------------------------------
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = var.ami_owners

  filter {
    name   = "name"
    values = var.ami_filter_name
  }

  filter {
    name   = "root-device-type"
    values = var.ami_root_device_type
  }

  filter {
    name   = "virtualization-type"
    values = var.ami_filter_virtualization_type
  }
}
# ===================================================


data "aws_vpc" "selected_dev" {
  # Allows dynamic lookup of information about the selected VPC.
  # Specifically it's ID
  tags = {
    Name = "Dev_vpc" //TODO change to variable
  }
}

data "aws_subnet" "selected_dev" {
  # Allows dynamic lookup of information about the given selected subnet.
  # Specifically it's ID
  tags = { 
    Name = "Web_Dev_aza_net" //TODO change to variable
    }
}

data "aws_security_group" "selected_dev" {
  # Allows dynamic lookup of information about the selected security group.
  # Specifically it's ID
  tags = {
    Name = "Mgmt_sg"
  }
}
