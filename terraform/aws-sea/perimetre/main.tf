#-------------------------------------------------------------------------------
# Configure the Amazon Elastic Compute Cloud (Amazon EC2)
module "elb" {
  source                            = "./modules/elb"
  eni_client_ip                     = var.candy_eni_client_ip
  eni_node_ip                       = var.candy_eni_node_ip
  elb_client_name                   = var.candy_elb_client_name
  tg_client_name                    = var.candy_tg_client_name
  elb_node_name                     = var.candy_elb_node_name
  tg_node_name                      = var.candy_tg_node_name
  tg_port_node                      = var.candy_tg_port_node
  tg_forwarding_port_client         = var.candy_tg_forwarding_port_client

  aws_application                   = var.candy_application
  aws_environment                   = var.candy_environment
  aws_profile                       = var.candy_profile
  aws_region                        = var.candy_region
  aws_availability_zone             = var.candy_availability_zone
}
