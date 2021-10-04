# General
candy_region        = "ca-central-1"
candy_profile       = "CandyDevNetwork"
candy_application   = "candy"
candy_environment   = "dev"
candy_instance_name = "Validator Node Instance"

#ami
candy_ami_owners                     = ["099720109477"]
candy_ami_filter_name                = ["*ubuntu-xenial-16.04-amd64-server-*"]
candy_ami_filter_root_device_type    = ["ebs"]
candy_ami_filter_virtualization_type = ["hvm"]

# ec2
#   - t3.large (for dev and test): 2CPU, 8GiB Memory
candy_ec2_instance_type = "t3.large"

# ebs
candy_ebs_name = "Validator Node Volume"
# 20G should be fine for dev.
candy_ebs_volume_size           = "20"
candy_ebs_volume_type           = "gp2"
candy_ebs_encrypted             = true
candy_ebs_kms_key_id            = "18205e1b-9b4f-4df0-ab4e-a5b2c9de07a4"
candy_ebs_delete_on_termination = true

# eip
candy_eip_client_ip_name = "Validator Node - Public Client IP"
candy_eip_node_ip_name   = "Validator Node - Public Node IP"

# eni
candy_eni_client_name        = "Validator Node - Client Interface"
candy_eni_client_description = "The network interface used for client communications."
candy_eni_client_ip          = "172.31.128.254"
candy_eni_node_name          = "Validator Node - Node Interface"
candy_eni_node_description   = "The network interface used for inter-node communications."
candy_eni_node_ip            = "172.31.35.134"

# subnet
candy_subnet_client_name       = "Validator Node - Client Subnet"
candy_subnet_client_cidr_block = "172.31.128.0/24"

# sg
candy_sg_name        = "node-security-group"
candy_sg_tag_name    = "Validator Node Security Group"
candy_sg_description = "Validator Node Security Group"
