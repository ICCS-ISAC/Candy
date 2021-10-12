resource "aws_security_group" "validator_node_security_group" {
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
    Name     = "${var.candy_instance_name} - Security Group"
    Instance = var.candy_instance_name
  }
}
