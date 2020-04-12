output "id" {
  description = "the ID of the nat gateway"  
  value = azurerm_nat_gateway.natgw.id
}

output "natgwip" {
  description = "the ID of the nat gateway"  
  value = azurerm_public_ip.natgw.ip_address
}
