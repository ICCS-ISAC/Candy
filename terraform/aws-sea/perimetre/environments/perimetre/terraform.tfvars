# General
candy_region            = "ca-central-1"
candy_profile           = "Perimetre"
candy_application       = "candy"
candy_environment       = "dev"
candy_availability_zone = "ca-central-1a"


# eni
candy_eni_client_ip          = "100.96.250.56"
candy_eni_node_ip            = "100.96.250.56"

# elb + tg
candy_elb_client_name           = "Candy-Validator9702-lb"
candy_elb_node_name             = "Candy-Validator9701-lb"
candy_tg_client_name            = "Candy-Validator-tg"
candy_tg_node_name              = "Candy-Validator-tg-9701"
candy_tg_port_node              = "9701"
candy_tg_forwarding_port_client = {
                                   "key_1": 22, "key_2": 9702
                                   } 
