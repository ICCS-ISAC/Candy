# ==================
# ToDo: Add VPC - Don't use default VPC.
# ==================

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