# ===================================================
# Configure the Amazon Elastic Compute Cloud (Amazon EC2) in the dev account
# ---------------------------------------------------
module "instance" {
  source                            = "./modules/node"
  ami_owners                        = var.candy_ami_owners
  ami_filter_name                   = var.candy_ami_filter_name
  ami_filter_virtualization_type    = var.candy_ami_filter_virtualization_type
  ami_root_device_type              = var.candy_ami_filter_root_device_type
  
  ec2_instance_type                 = var.candy_ec2_instance_type
  ec2_delete_on_termination         = var.candy_ec2_delete_on_termination

  ebs_name                          = var.candy_ebs_name
  ebs_volume_size                   = var.candy_ebs_volume_size
  ebs_volume_type                   = var.candy_ebs_volume_type
  ebs_encrypted                     = var.candy_ebs_encrypted
  ebs_kms_key_id                    = var.candy_ebs_kms_key_id
  
  sg_name                           = var.candy_sg_name
  sg_tag_name                       = var.candy_sg_tag_name
  sg_description                    = var.candy_sg_description
  
  eip_client_ip_name                = var.candy_eip_client_ip_name
  eip_node_ip_name                  = var.candy_eip_node_ip_name
  
  eni_client_name                   = var.candy_eni_client_name
  eni_client_description            = var.candy_eni_client_description
  eni_client_ip                     = var.candy_eni_client_ip
  eni_node_name                     = var.candy_eni_node_name
  eni_node_description              = var.candy_eni_node_description
  eni_node_ip                       = var.candy_eni_node_ip
  
  subnet_client_name                = var.candy_subnet_client_name
  subnet_client_cidr_block          = var.candy_subnet_client_cidr_block

  aws_application                   = var.candy_application
  aws_environment                   = var.candy_environment
  aws_profile_node                  = var.candy_profile_node
  aws_region                        = var.candy_region
  aws_availability_zone             = var.candy_availability_zone
}
# ===================================================

# ===================================================
# Configure the load balancer in the perimeter account
# ---------------------------------------------------
module "elb" {
  source                    = "./modules/elb"
  elb_node_ip               = var.candy_elb_node_ip
  elb_node_name             = var.candy_elb_node_name
  tg_node_name              = var.candy_tg_node_name
  tg_port_node              = var.candy_tg_port_node
  elb_listener_port_node    = var.candy_elb_listener_port_node

  elb_client_ip             = var.candy_elb_client_ip
  elb_client_name           = var.candy_elb_client_name
  tg_client_name            = var.candy_tg_client_name
  tg_forwarding_port_client = var.candy_tg_forwarding_port_client
  elb_listener_port_client  = var.candy_elb_listener_port_client

  aws_application           = var.candy_application
  aws_environment           = var.candy_environment
  aws_profile_perimeter     = var.candy_profile_perimeter
  aws_region                = var.candy_region
  aws_availability_zone     = var.candy_availability_zone
}
# ===================================================
