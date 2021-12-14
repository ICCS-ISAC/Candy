# Create VIP 9701 + 9702 + 22
resource "fortios_firewall_vip" "candy_vip" {
        for_each    = var.fortios_vip

	name        = "${var.aws_instance_name}-${each.value.elb_listener_port}"
        color       = 6
	type        = "static-nat"
	arp_reply   = "enable"
	extip       = var.eni_firewall_ip
	extintf     = "any"
        portforward = "enable"
        extport     = each.value.elb_listener_port
        mappedport  = each.value.tg_port
	mappedip { 
              range = "${each.value.eni_ip}-${each.value.eni_ip}"
        }
        vdomparam   = "FG-traffic"
       	comment     = "Created by Terraform"
}

 # Create policy within 'Candy_9701' + 'Candy_9702' + 'Candy_22' policy package
resource "fortios_firewall_policy" "Candy_policy" {
        for_each = fortios_firewall_vip.candy_vip
        
	name     = "in-internet-out-${var.aws_instance_name}-${each.value.extport}"
	srcaddr {
                name = "all"
        }
	srcintf {
                name = "port1"
        }
	dstaddr {
                name = each.value.name
        }
	dstintf {
                name = "tgw-vpn1"
        }
	service {
                name = "ALL"
        }
        poolname {
                name = "cluster-ippool"
        }
        ippool     = "enable"
	action     = "accept"
	schedule   = "always"
	logtraffic = "all"
	nat        = "enable"
        vdomparam  = "FG-traffic"
	comments   = "Created by Terraform"
}  
