terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.61.0"
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

data "aws_subnet" "default" {
  # Allows dynamic lookup of information about the given default subnet.
  # Specifically it's ID
  cidr_block = "172.31.32.0/20"
}

resource "aws_instance" "validator_node_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.candy_ec2_instance_type

  # ===============================================================
  # Provinces Hosting in AWS will want to ensure their
  # nodes are in different availability zones
  # ---------------------------------------------------------------
  # availability_zone           = "ca-central-1d"
  # ===============================================================

  root_block_device {
    volume_size = var.candy_ebs_volume_size
    volume_type = var.candy_ebs_volume_type
    encrypted   = var.candy_ebs_encrypted
    # ===============================================================
    # This ID is specific to a specific account:
    #   - Encrypted volume required?
    #     - For this the AMI being used; yes.
    #     - Seems to be specific to the Protected B environment.
    #   - Make dynamic if using an encrypted volume
    #   - Keys will need to be protected from accedental distruction
    # ---------------------------------------------------------------
    # kms_key_id            = var.candy_ebs_kms_key_id
    # ===============================================================
    delete_on_termination = var.candy_ebs_delete_on_termination

    tags = {
      Name        = var.candy_ebs_name
      Application = var.candy_application
      Environment = var.candy_environment
    }
  }

  network_interface {
    network_interface_id = aws_network_interface.validator_node_node_interface.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.validator_node_client_interface.id
    device_index         = 1
  }

  tags = {
    Name        = var.candy_instance_name
    Application = var.candy_application
    Environment = var.candy_environment
  }
}

resource "aws_security_group" "validator_node_security_group" {
  name        = var.candy_sg_name
  description = var.candy_sg_description

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks      = ["0.0.0.0/0"]
    from_port        = "9701"
    ipv6_cidr_blocks = ["::/0"]
    protocol         = "tcp"
    self             = "false"
    to_port          = "9709"
  }

  tags = {
    Name        = var.candy_sg_tag_name
    Application = var.candy_application
    Environment = var.candy_environment
  }
}

resource "aws_subnet" "validator_node_client_subnet" {
  assign_ipv6_address_on_creation = "false"
  cidr_block                      = var.candy_subnet_client_cidr_block
  map_public_ip_on_launch         = "false"
  vpc_id                          = data.aws_vpc.default.id

  tags = {
    Name        = var.candy_subnet_client_name
    Application = var.candy_application
    Environment = var.candy_environment
  }
}

resource "aws_network_interface" "validator_node_node_interface" {
  description        = var.candy_eni_node_description
  ipv6_address_count = "0"
  private_ip         = var.candy_eni_node_ip
  private_ips        = [var.candy_eni_node_ip]
  private_ips_count  = "0"
  security_groups    = [aws_security_group.validator_node_security_group.id]
  source_dest_check  = "true"
  subnet_id          = data.aws_subnet.default.id

  tags = {
    Name        = var.candy_eni_node_name
    Application = var.candy_application
    Environment = var.candy_environment
  }
}

resource "aws_network_interface" "validator_node_client_interface" {
  description        = var.candy_eni_client_description
  ipv6_address_count = "0"
  private_ip         = var.candy_eni_client_ip
  private_ips        = [var.candy_eni_client_ip]
  private_ips_count  = "0"
  security_groups    = [aws_security_group.validator_node_security_group.id]
  source_dest_check  = "true"
  subnet_id          = aws_subnet.validator_node_client_subnet.id

  tags = {
    Name        = var.candy_eni_client_name
    Application = var.candy_application
    Environment = var.candy_environment
  }
}

resource "aws_eip" "validator_node_public_node_ip" {
  vpc                       = "true"
  network_interface         = aws_network_interface.validator_node_node_interface.id
  associate_with_private_ip = var.candy_eni_node_ip

  tags = {
    Name        = var.candy_eip_node_ip_name
    Application = var.candy_application
    Environment = var.candy_environment
  }
}

resource "aws_eip" "validator_node_public_client_ip" {
  vpc                       = "true"
  network_interface         = aws_network_interface.validator_node_client_interface.id
  associate_with_private_ip = var.candy_eni_client_ip

  tags = {
    Name        = var.candy_eip_client_ip_name
    Application = var.candy_application
    Environment = var.candy_environment
  }
}
