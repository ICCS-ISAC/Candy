# Filter the image you want to use for the ec2 instance
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = var.ec2_owners

  filter {
    name   = "name"
    values = var.ec2_filter_name
  }
  filter {
    name = "root-device-type"
    values = var.ec2_root_device_type
  }
  filter {
    name   = "virtualization-type"
    values = var.ec2_filter_virtualization_type
  }
}

data "aws_vpc" "selected" {
  # Allows dynamic lookup of information about the selected VPC.
  # Specifically it's ID
  tags = {
    Name = "Dev_vpc" //TODO change to variable
  }
}

data "aws_subnet" "selected" {
  # Allows dynamic lookup of information about the given selected subnet.
  # Specifically it's ID
  tags = { 
    Name = "Web_Dev_aza_net" //TODO change to variable
    }
}

data "aws_security_group" "selected" {
  # Allows dynamic lookup of information about the selected security group.
  # Specifically it's ID
  tags = {
    Name = "Mgmt_sg"
  }
}

resource "aws_instance" "validator_node_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance_type
  // TODO add Create a new key pair OR Reuse an existing key pair AND combine with kms
  // https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair
  key_name      = "candy_key" 

  # ===============================================================
  # Provinces Hosting in AWS will want to ensure their
  # nodes are in different availability zones
  # ---------------------------------------------------------------
  # availability_zone           = "ca-central-1d"
  # ===============================================================

  root_block_device {
    volume_size = var.ebs_volume_size
    volume_type = var.ebs_volume_type
    encrypted   = var.ebs_encrypted

    # ===============================================================
    # This ID is specific to a specific account:
    #   - Encrypted volume required?
    #     - For this the AMI being used; yes.
    #     - Seems to be specific to the Protected B environment.
    #   - Make dynamic if using an encrypted volume
    #   - Keys will need to be protected from accedental distruction
    # ---------------------------------------------------------------
    //TODO create data to retreive the key created by aws-sea in the account
    kms_key_id            = var.ebs_kms_key_id
    # ===============================================================

    delete_on_termination = var.ec2_delete_on_termination

    tags = {
      Name        = var.ebs_name
      Application = var.aws_application
      Environment = var.aws_environment
    }
  }

  # ============================================================================
  # Without eni or resource "aws_network_interface" you have to declare these with your ec2
  # ---------------------------------------------------------------
  # security_groups    = [aws_security_group.validator_node_security_group.id]
  # subnet_id          = data.aws_subnet.selected.id
  # ============================================================================
  
  
  network_interface {
    network_interface_id = aws_network_interface.validator_node_node_interface.id
    device_index         = 0
  }
  

   network_interface {
    network_interface_id = aws_network_interface.validator_node_client_interface.id
    device_index         = 1
  }
 

  tags = {
    Name        = var.ec2_instance_name
    Application = var.aws_application
    Environment = var.aws_environment
  }
}

resource "aws_security_group" "validator_node_security_group" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = data.aws_vpc.selected.id
  
  //TODO We could check for outbound on 9701 for inter-node the IP of the other nodes
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  # ===============================================================
  # The IP address/port used for inter-node consensus must be configured 
  # for exclusive use of inter-node consensus traffic. 
  # Ideally, traffic to this address/port will be whitelisted in your firewall.
  # ---------------------------------------------------------------
  ingress {
    cidr_blocks      = ["0.0.0.0/0"]
    from_port        = "9701"
    ipv6_cidr_blocks = ["::/0"]
    protocol         = "tcp"
    self             = "false"
    to_port          = "9709"
  }
  # ===============================================================

  # ===============================================================
  # The SSH is used so that the CLI can access the nodes through it's
  # Client IP address/port used for Steward Operations and Network Operations.
  # Ideally, traffic to this address/port will be whitelisted in your firewall.
  # ---------------------------------------------------------------
  ingress {
    cidr_blocks      = ["0.0.0.0/0"]//TODO restrict SSH access to Admins only, add IP addresses for all admin users of the system
    from_port        = "22"
    ipv6_cidr_blocks = ["::/0"]
    protocol         = "tcp"
    self             = "false"
    to_port          = "22"
  }
  # ===============================================================

  tags = {
    Name        = var.sg_tag_name
    Application = var.aws_application
    Environment = var.aws_environment
  }
}


resource "aws_network_interface" "validator_node_node_interface" {
  description        = var.eni_node_description
  ipv6_address_count = "0"
  private_ip         = var.eni_node_ip
  private_ips        = [var.eni_node_ip]
  private_ips_count  = "0"
  security_groups    = [aws_security_group.validator_node_security_group.id, data.aws_security_group.selected.id]
  source_dest_check  = "true"
  subnet_id          = data.aws_subnet.selected.id

  tags = {
    Name        = var.eni_node_name
    Application = var.aws_application
    Environment = var.aws_environment
  }
}


resource "aws_network_interface" "validator_node_client_interface" {
  description        = var.eni_client_description
  ipv6_address_count = "0"
  private_ip         = var.eni_client_ip
  private_ips        = [var.eni_client_ip]
  private_ips_count  = "0"
  security_groups    = [aws_security_group.validator_node_security_group.id, data.aws_security_group.selected.id]
  source_dest_check  = "true"
  subnet_id          = data.aws_subnet.selected.id

  tags = {
    Name        = var.eni_client_name
    Application = var.aws_application
    Environment = var.aws_environment
  }
}
