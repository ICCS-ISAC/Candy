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
  profile = "CandyDevNetwork"
  region  = "ca-central-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "validator_client_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.large"
  vpc_security_group_ids = ["sg-04ba791c39ddb8d52"]
  subnet_id              = "subnet-0d4b6d25ebd3bb0e1"

  root_block_device {
    volume_size           = "20"
    volume_type           = "gp2"
    encrypted             = true
    kms_key_id            = "18205e1b-9b4f-4df0-ab4e-a5b2c9de07a4"      
    delete_on_termination = true
  }

  tags = {
    Name = "ValidatorClientServerInstance"
  }
}
