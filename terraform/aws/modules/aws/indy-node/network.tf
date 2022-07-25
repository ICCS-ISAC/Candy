resource "aws_vpc" "node_vpc" {
  cidr_block = "172.31.0.0/16"

  tags = {
    Name     = "${var.instance_name} - VPC"
    Instance = var.instance_name
  }
}

resource "aws_internet_gateway" "node_gateway" {
  vpc_id = aws_vpc.node_vpc.id
  tags = {
    Name     = "${var.instance_name} - Internet Gateway"
    Instance = var.instance_name
  }
}

resource "aws_route" "gateway_route" {
  route_table_id = aws_vpc.node_vpc.default_route_table_id

  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.node_gateway.id
}

resource "aws_subnet" "client_subnet" {
  count = var.use_elastic_ips ? 1 : 0

  assign_ipv6_address_on_creation = false
  cidr_block                      = var.subnet_client_cidr_block
  map_public_ip_on_launch         = var.use_elastic_ips ? false : true
  availability_zone               = aws_instance.indy_node.availability_zone
  vpc_id                          = aws_vpc.node_vpc.id

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
  vpc_id = aws_vpc.node_vpc.id

  tags = {
    Name     = "${var.instance_name} - Node Subnet"
    Instance = var.instance_name
  }
}
