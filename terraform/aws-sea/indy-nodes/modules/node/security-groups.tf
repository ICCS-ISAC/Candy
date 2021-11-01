resource "aws_security_group" "validator_node_security_group" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = data.aws_vpc.selected_dev.id
  
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