data "azurerm_resource_group" "natgw" {
  name = var.rgname
}

resource "azurerm_public_ip" "natgw" {
  name                = "nat-gateway-publicIP"
  location            = data.azurerm_resource_group.natgw.location
  resource_group_name = data.azurerm_resource_group.natgw.name
  allocation_method   = "Static"
  sku                 = "Standard"
  depends_on          = [var.natgw_depends_on] // To prevent "retryable error when creating VM extension - unlogged bug at time of writing"
}

resource "azurerm_nat_gateway" "natgw" {
  name                    = "nat-Gateway"
  location                = data.azurerm_resource_group.natgw.location
  resource_group_name     = data.azurerm_resource_group.natgw.name
  public_ip_address_ids   = [azurerm_public_ip.natgw.id]
  sku_name                = "Standard"
  idle_timeout_in_minutes = 4
  depends_on              = [var.natgw_depends_on] // To prevent "retryable error when creating VM extension - unlogged bug at time of writing"
}