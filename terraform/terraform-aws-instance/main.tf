terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = var.candy_profile
  region  = var.candy_region
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = var.candy_ami_owners

  filter {
    name   = "name"
    values = var.candy_ami_filter_name
  }

  filter {
    name   = "virtualization-type"
    values = var.candy_ami_filter_virtualization_type
  }
}

resource "aws_instance" "validator_client_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.candy_ec2_instance_type
  vpc_security_group_ids = var.candy_ec2_vpc_security_group_ids
  subnet_id              = var.candy_ec2_subnet_id

  root_block_device {
    volume_size           = var.candy_ebs_volume_size
    volume_type           = var.candy_ebs_volume_type 
    encrypted             = var.candy_ebs_encrypted
    kms_key_id            = var.candy_ebs_kms_key_id    
    delete_on_termination = var.candy_ebs_delete_on_termination
  }

  tags = {
         Name = "ValidatorClientServerInstance"
         Application = var.candy_application
         Environment = var.candy_environment
  }
}
