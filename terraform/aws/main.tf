# Note:
#   - When using elastic IP addresses, the limit is 5 per region
#     so, you are limited to 2 nodes using elastic IP addresses.
module "indy-node" {
  source = "./modules/aws/indy-node"

  count             = var.candy_instance_count
  instance_name     = "${var.candy_instance_name}-${count.index + 1}"
  application_name  = var.candy_application_name
  environment       = var.candy_environment
  zone              = data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]
  ami_id            = data.aws_ami.ubuntu.id
  ec2_instance_type = var.candy_ec2_instance_type

  root_volume_size          = var.candy_root_volume_size
  data_volume_size          = var.candy_data_volume_size
  ebs_volume_type           = var.candy_ebs_volume_type
  ebs_encrypted             = var.candy_ebs_encrypted
  ebs_kms_key_id            = var.candy_ebs_kms_key_id
  ebs_delete_on_termination = var.candy_ebs_delete_on_termination

  iam_profile = data.aws_iam_role.ssm_role.id

  ssh_source_address = var.candy_ssh_source_address

  use_elastic_ips = var.candy_use_elastic_ips

  subnet_node_cidr_block   = "${var.candy_subnet_cidr_block_prefix}${var.candy_subnet_cidr_starting_address + count.index + (count.index % (var.candy_subnet_cidr_starting_address + count.index))}.0/24"
  subnet_client_cidr_block = "${var.candy_subnet_cidr_block_prefix}${var.candy_subnet_cidr_starting_address + count.index + 1 + (count.index % (var.candy_subnet_cidr_starting_address + count.index + 1))}.0/24"
  vpc_node_cidr_block      = var.candy_vpc_node_cidr_block

  client_port  = var.candy_client_port
  node_port    = var.candy_node_port
  ssh_key_name = aws_key_pair.ansible.key_name
}
