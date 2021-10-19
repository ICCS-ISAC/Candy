data "aws_vpc" "selected" {
  # Allows dynamic lookup of information about the selected VPC.
  # Specifically it's ID
  tags = {
    Name = "Perimeter_vpc" //TODO change to variable
  }
}

data "aws_subnet" "selected" {
  # Allows dynamic lookup of information about the given selected subnet.
  # Specifically it's ID
  tags = { 
    Name = "Public_Perimeter_aza_net" //TODO change to variable
    }
}
resource "aws_lb" "client_interface" {
  name               = var.elb_client_name
  internal           = true
  load_balancer_type = "network"
  subnets            = [data.aws_subnet.selected.id]
  enable_deletion_protection = false
}

resource "aws_lb" "node_interface" {
  name               = var.elb_node_name
  internal           = true
  load_balancer_type = "network"
  subnets            = [data.aws_subnet.selected.id]
  enable_deletion_protection = false
}

resource "aws_lb_listener" "client_interface" {
  for_each            = var.tg_listener_port_client
  load_balancer_arn   = aws_lb.client_interface.arn
  protocol            = "TCP"
  port                = each.value
  default_action {
    target_group_arn = "${aws_lb_target_group.client_interface[each.key].arn}"
    type             = "forward"
  }
}

resource "aws_lb_listener" "node_interface" {
  load_balancer_arn   = aws_lb.node_interface.arn
  protocol            = "TCP"
  port                = var.tg_port_node
  default_action {
    target_group_arn = aws_lb_target_group.node_interface.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group" "client_interface" {
  for_each    = var.tg_forwarding_port_client
  name        = "${var.tg_client_name}-${each.value}"
  target_type = "ip"
  port        = each.value
  protocol    = "TCP"
  vpc_id      = data.aws_vpc.selected.id

  depends_on  = [
    aws_lb.client_interface
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group" "node_interface" {
  name        = var.tg_node_name
  target_type = "ip"
  port        = "9701"
  protocol    = "TCP"
  vpc_id      = data.aws_vpc.selected.id

  depends_on  = [
    aws_lb.node_interface
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group_attachment" "client_interface" {
  for_each          = var.tg_forwarding_port_client
  target_group_arn  = "${aws_lb_target_group.client_interface[each.key].arn}"
  target_id         = var.eni_client_ip
  availability_zone = var.aws_availability_zone
  port              = each.value
}

resource "aws_lb_target_group_attachment" "node_interface" {
  target_group_arn  = aws_lb_target_group.node_interface.arn
  target_id         = var.eni_node_ip
  availability_zone = var.aws_availability_zone
  port              = var.tg_port_node
}