

resource "aws_instance" "indy_node" {
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
    kms_key_id            = var.ebs_kms_key_id
    # ===============================================================

    delete_on_termination = var.ec2_delete_on_termination
    
    // Tags added to default tags in provider.tf
    tags = {
      Name        = "${var.aws_instance_name}-Volume"
    }
  }

  # ============================================================================
  # Without eni or resource "aws_network_interface" you have to declare these with your ec2
  # ---------------------------------------------------------------
  # security_groups    = [aws_security_group.validator_node_security_group.id]
  # subnet_id          = data.aws_subnet.selected_dev.id
  # ============================================================================
  
  
  # Default (primary) network interfaces can only be attached here.
  network_interface {
    network_interface_id = aws_network_interface.node_nic.id
    device_index         = 0
  }
 
  // Tags added to default tags in provider.tf
  tags = {
    Name        = "${var.aws_instance_name}-ec2"
  }
}

resource "aws_network_interface_attachment" "client_interface_attachment" {
  instance_id          = aws_instance.indy_node.id
  network_interface_id = aws_network_interface.client_nic.id
  device_index         = 1
}

resource "aws_network_interface" "node_nic" {
  description        = var.eni_node_description
  ipv6_address_count = "0"
  private_ip         = var.eni_node_ip
  private_ips        = [var.eni_node_ip]
  private_ips_count  = "0"
  security_groups    = [aws_security_group.validator_node_security_group.id, data.aws_security_group.selected_dev.id]
  source_dest_check  = "true"
  subnet_id          = data.aws_subnet.selected_dev.id
  
  // Tags added to default tags in provider.tf
  tags = {
    Name        = "${var.aws_instance_name}-NodeInterface"
  }
}


resource "aws_network_interface" "client_nic" {
  description        = var.eni_client_description
  ipv6_address_count = "0"
  private_ip         = var.eni_client_ip
  private_ips        = [var.eni_client_ip]
  private_ips_count  = "0"
  security_groups    = [aws_security_group.validator_node_security_group.id, data.aws_security_group.selected_dev.id]
  source_dest_check  = "true"
  subnet_id          = data.aws_subnet.selected_dev.id
  
  // Tags added to default tags in provider.tf
  tags = {
    Name        = "${var.aws_instance_name}-ClientInterface"
  }
}
