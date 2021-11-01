# ====================================================================================================
# Notes:
# ----------------------------------------------------------------------------------------------------
# The module supports creating node instances with or without elastic IPs, 
# by setting the 'use_elastic_ips' variable to 'true' or 'false'.
# This supports the scenario where you want to create a network of nodes in the same region.
# AWS only supports 5 elastic IPs per region, which is not enough to support
# the minimum of four nodes for the network.
# When 'use_elastic_ips' is set to false a public IP address is assigned to the instance by default
# and only a single interface and subnet are created.  Meaning the node will need to share the one
# interface for both node and client communications.  Otherwise, separate interfaces and subnets 
# are created for node and client communication and each interface is assigned an elastic IP.
# ====================================================================================================

resource "aws_instance" "indy_node" {
  ami                  = var.ami_id
  instance_type        = var.ec2_instance_type
  iam_instance_profile = var.iam_profile

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
    # kms_key_id            = var.ebs_kms_key_id
    # ===============================================================
    delete_on_termination = var.ebs_delete_on_termination

    tags = {
      # Default tags don't reach this level.
      Name        = "${var.instance_name} Volume"
      Application = var.application_name
      Environment = var.environment
      Instance    = var.instance_name
    }
  }

  # Default (primary) network interfaces can only be attached here.
  network_interface {
    network_interface_id = aws_network_interface.node_nic.id
    device_index         = 0
  }

  tags = {
    Name     = var.instance_name
    Instance = var.instance_name
  }
}

# This allows the second network interface to be detached, modified, re-attached if needed.
resource "aws_network_interface_attachment" "client_interface_attachment" {
  count = var.use_elastic_ips ? 1 : 0

  instance_id          = aws_instance.indy_node.id
  network_interface_id = aws_network_interface.client_nic[count.index].id
  device_index         = 1
}

resource "aws_subnet" "node_subnet" {
  assign_ipv6_address_on_creation = false
  cidr_block                      = var.subnet_node_cidr_block
  map_public_ip_on_launch         = var.use_elastic_ips ? false : true
  # availability_zone               = aws_instance.indy_node.availability_zone
  vpc_id                          = var.default_vpc_id

  tags = {
    Name     = "${var.instance_name} - Node Subnet"
    Instance = var.instance_name
  }
}

resource "aws_subnet" "client_subnet" {
  count = var.use_elastic_ips ? 1 : 0

  assign_ipv6_address_on_creation = false
  cidr_block                      = var.subnet_client_cidr_block
  map_public_ip_on_launch         = var.use_elastic_ips ? false : true
  availability_zone               = aws_instance.indy_node.availability_zone
  vpc_id                          = var.default_vpc_id

  tags = {
    Name     = "${var.instance_name} - Client Subnet"
    Instance = var.instance_name
  }
}

resource "aws_network_interface" "node_nic" {
  description        = "The network interface used for inter-node communications."
  ipv6_address_count = 0
  private_ips_count  = 0
  security_groups    = var.security_groups
  source_dest_check  = true
  subnet_id          = aws_subnet.node_subnet.id

  tags = {
    Name     = "${var.instance_name} - Node Interface"
    Instance = var.instance_name
  }
}

resource "aws_network_interface" "client_nic" {
  count = var.use_elastic_ips ? 1 : 0

  description        = "The network interface used for client communications."
  ipv6_address_count = 0
  private_ips_count  = 0
  security_groups    = var.security_groups
  source_dest_check  = true
  subnet_id          = aws_subnet.client_subnet[count.index].id

  tags = {
    Name     = "${var.instance_name} - Client Interface"
    Instance = var.instance_name
  }
}

resource "aws_eip" "public_node_ip" {
  count = var.use_elastic_ips ? 1 : 0

  vpc                       = true
  network_interface         = aws_network_interface.node_nic.id
  associate_with_private_ip = aws_network_interface.node_nic.private_ip

  tags = {
    Name     = "${var.instance_name} - Node IP"
    Instance = var.instance_name
  }
}

resource "aws_eip" "public_client_ip" {
  count = var.use_elastic_ips ? 1 : 0

  vpc                       = true
  network_interface         = aws_network_interface.client_nic[count.index].id
  associate_with_private_ip = aws_network_interface.client_nic[count.index].private_ip
  tags = {
    Name     = "${var.instance_name} - Client IP"
    Instance = var.instance_name
  }
}
