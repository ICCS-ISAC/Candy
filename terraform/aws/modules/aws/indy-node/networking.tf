resource "aws_key_pair" "ansible" {
  key_name   = "ansible-key"
  public_key = var.public_ssh_key
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

resource "aws_security_group" "client_security_group" {
  # description = var.candy_sg_description

  tags = {
    Name     = "${var.instance_name} - Client Security Group"
    Instance = var.instance_name
  }
}

resource "aws_security_group_rule" "client_security_group_rule_indy" {
  type              = "ingress"
  cidr_blocks      = ["0.0.0.0/0"]
  from_port         = var.client_port
  to_port           = var.client_port
  protocol          = "tcp"
  security_group_id = aws_security_group.client_security_group.id
}

resource "aws_security_group" "node_security_group" {
  # description = var.candy_sg_description

  tags = {
    Name     = "${var.instance_name} - Node Security Group"
    Instance = var.instance_name
  }
}

resource "aws_security_group_rule" "node_security_group_rule_ssh" {
  type              = "ingress"
  cidr_blocks      = [var.ssh_source_address]
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.node_security_group.id
}

resource "aws_security_group_rule" "node_security_group_rule_indy" {
  type              = "ingress"
  cidr_blocks      = ["0.0.0.0/0"]
  from_port         = var.node_port
  to_port           = var.node_port
  protocol          = "tcp"
  security_group_id = aws_security_group.node_security_group.id
}

resource "aws_network_interface" "client_nic" {
  count = var.use_elastic_ips ? 1 : 0

  description        = "The network interface used for client communications."
  ipv6_address_count = 0
  private_ips_count  = 0
  security_groups    = [aws_security_group.client_security_group.id]
  source_dest_check  = true
  subnet_id          = aws_subnet.client_subnet[count.index].id

  tags = {
    Name     = "${var.instance_name} - Client Interface"
    Instance = var.instance_name
  }
}

resource "aws_network_interface" "node_nic" {
  description        = "The network interface used for inter-node communications."
  ipv6_address_count = 0
  private_ips_count  = 0
  security_groups    = [aws_security_group.node_security_group.id]
  source_dest_check  = true
  subnet_id          = aws_subnet.node_subnet.id

  tags = {
    Name     = "${var.instance_name} - Node Interface"
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
