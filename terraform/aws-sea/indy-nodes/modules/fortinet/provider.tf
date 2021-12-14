terraform {
  required_version = ">= 0.12"
  required_providers {
     fortios = {
       source  = "fortinetdev/fortios"
       version = ">= 1.10.2" 
     }
  }    
}

provider "fortios" {
  hostname = var.fortios_hostname
  token    = var.fortios_token
  insecure = true
  vdom     = "FG-traffic"
}