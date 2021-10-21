# General
candy_region            = "ca-central-1"
candy_profile           = "Perimetre"
candy_application       = "candy"
candy_environment       = "dev"
candy_availability_zone = "ca-central-1a"

# eip
candy_eip_client_allocation_id          = "eipalloc-048857b1bba29edb8"
candy_eip_node_allocation_id            = "eipalloc-0e08424ec957a95c1"

# eni
candy_eni_firewall_ip        = "100.96.250.56"

# elb + tg
candy_elb_client_name           = "Candy-Validator9702-lb"
candy_elb_node_name             = "Candy-Validator9701-lb"
candy_tg_client_name            = "Candy-Validator-tg-Client"
candy_tg_node_name              = "Candy-Validator-tg-Node"
candy_tg_port_node              = "19701"
candy_elb_listener_port_node    = "9701"
candy_elb_listener_port_client  =  {
                                    "key_1": 22, "key_2": 9702
                                    } 
candy_tg_forwarding_port_client =  {
                                    "key_1": 122, "key_2": 19702
                                    } 