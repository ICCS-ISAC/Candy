# General
candy_region            = "ca-central-1"
candy_profile           = "CandyDevNetwork"
candy_application       = "candy"
candy_environment       = "dev"
candy_instance_name     = "Validator Node Instance"
candy_availability_zone = "ca-central-1a"

#ami
candy_ami_owners                     = ["099720109477"]
candy_ami_filter_name                = ["*ubuntu-xenial-16.04-amd64-server-*"]
candy_ami_filter_root_device_type    = ["ebs"]
candy_ami_filter_virtualization_type = ["hvm"]

# ec2
#   - t3.large (for dev and test): 2CPU, 8GiB Memory
candy_ec2_instance_type = "t3.large"
candy_ec2_delete_on_termination = false

# ebs
candy_ebs_name = "Validator Node Volume"
# 20G should be fine for dev.
candy_ebs_volume_size           = "20"
candy_ebs_volume_type           = "gp2"
candy_ebs_encrypted             = true

//TODO create data to retreive the key created by aws-sea in the account
candy_ebs_kms_key_id            = "8a631aa1-e26f-4ff6-85e0-4cf9b6784ee6"
#candy_ebs_kms_key_id            = "a3b421c9-08ba-4477-a771-a3b748ce0049"
	
# eip
candy_eip_client_ip_name = "Validator Node - Public Client IP"
candy_eip_node_ip_name   = "Validator Node - Public Node IP"

# eni
candy_eni_client_name        = "Validator Node - Client Interface"
candy_eni_client_description = "The network interface used for client communications."
candy_eni_client_ip          = "10.2.32.252"
candy_eni_node_name          = "Validator Node - Node Interface"
candy_eni_node_description   = "The network interface used for inter-node communications."
candy_eni_node_ip            = "10.2.32.132"

# subnet
candy_subnet_client_name       = "Validator Node - Client Subnet"
candy_subnet_client_cidr_block = "10.2.32.0/20"

# sg
candy_sg_name        = "node-security-group"
candy_sg_tag_name    = "Validator Node Security Group"
candy_sg_description = "Validator Node Security Group"

# elb + tg
candy_elb_client_name           = "Candy-Validator9702-lb"
candy_elb_node_name             = "Candy-Validator9701-lb"
candy_tg_client_name            = "Candy-Validator-tg"
candy_tg_node_name              = "Candy-Validator-tg-9701"
candy_tg_port_node              = "9701"
candy_tg_forwarding_port_client = {
                                   "key_1": 22, "key_2": 9702
                                   } 

candy_listener_port_client = {
                                   "key_1": 22, "key_2": 9702
                                   } 
