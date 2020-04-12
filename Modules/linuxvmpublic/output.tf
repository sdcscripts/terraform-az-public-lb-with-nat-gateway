output "vmnicip" {
  description = "the ip address of the vm"  
  value = azurerm_network_interface.myterraformnic.private_ip_address
}

output "id" {
  description = "the ID of the vm"  
  value = azurerm_virtual_machine.myterraformvm.id
}

output "public_ip_dns_name" {
  description = "fqdn to connect to the vm provisioned."
  value       = azurerm_public_ip.myterraformpublicip.fqdn
}

output "vmnicipid" {
  description = "the ID of the NIC of the vm"  
  value = azurerm_network_interface.myterraformnic.id
}
