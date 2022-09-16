output "node_info" {
  value = [aws_instance.indy_node.public_ip, aws_ebs_volume.data_volume.id, random_id.node_seed.b64_url]
}
