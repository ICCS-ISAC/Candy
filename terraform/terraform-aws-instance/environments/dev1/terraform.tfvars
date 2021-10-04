# General
candy_region       = "ca-central-1"
candy_profile      = "CandyDevNetwork"
candy_system_name  = "sso"
candy_application  = "candy"
candy_environment  = "dev"

#ami
candy_ami_owners                     = ["099720109477"]
candy_ami_filter_name                = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
candy_ami_filter_virtualization_type = ["hvm"]

# ec2
candy_ec2_instance_type           = "t3.large"
candy_ec2_vpc_security_group_ids  = ["sg-04ba791c39ddb8d52"]
candy_ec2_subnet_id               ="subnet-0d4b6d25ebd3bb0e1"

#ebs
candy_ebs_volume_size             = "20"
candy_ebs_volume_type             = "gp2"
candy_ebs_encrypted               = true
candy_ebs_kms_key_id              = "18205e1b-9b4f-4df0-ab4e-a5b2c9de07a4"      
candy_ebs_delete_on_termination   = true
