resource "aws_lb" "client_lb" {
  name               = "${var.aws_instance_name}-${var.elb_client_name}"
  internal           = false
  load_balancer_type = "network"
  subnet_mapping {
       subnet_id = data.aws_subnet.selected.id
       allocation_id = var.eip_client_allocation_id
  }
  enable_deletion_protection = false
}

resource "aws_lb" "node_lb" {
  name               = "${var.aws_instance_name}-${var.elb_node_name}"
  internal           = false
  load_balancer_type = "network"
  subnet_mapping {
       subnet_id = data.aws_subnet.selected.id
       allocation_id = var.eip_node_allocation_id
  }
  enable_deletion_protection = false
}

resource "aws_lb_listener" "client_lb_listener" {
  for_each            = var.elb_listener_port_client
  load_balancer_arn   = aws_lb.client_lb.arn
  protocol            = "TCP"
  port                = each.value
  default_action {
    target_group_arn = "${aws_lb_target_group.client_tg[each.key].arn}"
    type             = "forward"
  }
}

resource "aws_lb_listener" "node_lb_listener" {
  load_balancer_arn   = aws_lb.node_lb.arn
  protocol            = "TCP"
  port                = var.elb_listener_port_node
  
  default_action {
    target_group_arn = aws_lb_target_group.node_tg.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group" "client_tg" {
  for_each    = var.tg_forwarding_port_client
  name        = "${var.aws_instance_name}-${var.tg_client_name}-${each.value}"
  target_type = "ip"
  port        = each.value
  protocol    = "TCP"
  vpc_id      = data.aws_vpc.selected.id

  depends_on  = [
    aws_lb.client_lb
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group" "node_tg" {
  name        = "${var.aws_instance_name}-${var.tg_node_name}-${var.tg_port_node}"
  target_type = "ip"
  port        = var.tg_port_node
  protocol    = "TCP"
  vpc_id      = data.aws_vpc.selected.id

  depends_on  = [
    aws_lb.node_lb
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group_attachment" "client_tg_attachment" {
  for_each          = var.tg_forwarding_port_client
  target_group_arn  = "${aws_lb_target_group.client_tg[each.key].arn}"
  target_id         = var.eni_firewall_ip
  availability_zone = var.aws_availability_zone
  port              = each.value
}

resource "aws_lb_target_group_attachment" "node_tg_attachment" {
  target_group_arn  = aws_lb_target_group.node_tg.arn
  target_id         = var.eni_firewall_ip
  availability_zone = var.aws_availability_zone
  port              = var.tg_port_node
}