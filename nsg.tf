resource "azurerm_resource_group" "nsgrg" {
  name     = "${var.projidprefix}-${var.nsg_rg_name}"
  location = var.location
}

module "vnet1-nsg" {
  source                = "./modules/nsg"
  resource_group_name   = azurerm_resource_group.nsgrg.name
  security_group_name   = "Allow-SSH"
  source_address_prefix = ["*"]
  predefined_rules = [
    {
      name     = "SSH"
      priority = "100"
      destination_address_prefix = [module.linuxvm1.vmnicip, module.linuxvm2.vmnicip]
    },
    {
      name     = "HTTP"
      priority = "110"
      destination_address_prefix = [module.linuxvm1.vmnicip, module.linuxvm2.vmnicip]
    }
  ] 
}