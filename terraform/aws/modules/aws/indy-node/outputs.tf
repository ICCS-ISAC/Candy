output "node_address" {
  value = aws_instance.indy_node.public_dns
}