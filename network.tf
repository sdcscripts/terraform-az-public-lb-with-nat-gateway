// vnet creation 
module "vnet1" {
    source              = "./modules/networkbuild"
    location            = var.location
    vnet_name           = var.vnet1_name                                                # edit if secondary vnet
    resource_group_name = "${var.projidprefix}-${var.networkrgname}"                    # edit if resource sits with other vnets in one RG
    address_space       = "10.0.0.0/16"                                                 # edit
    subnet_prefixes     = ["10.0.1.0/26", "10.0.2.0/24", "10.0.3.0/24"]                 # edit
    subnet_names        = ["Web", "Logic", "Database"]                                  # edit
}

module natgw {
  source           = "./modules/natgw"
  rgname           = module.vnet1.vnet_rg_name
  natgw_depends_on = [azurerm_virtual_machine_extension.vm1extension,azurerm_virtual_machine_extension.vm2extension] // To prevent "retryable error when creating VM extension - unlogged bug at time of writing"
}

// nsg associations 

resource "azurerm_subnet_network_security_group_association" "linux_web_tier_ssh_nsg" {
  subnet_id                 = module.vnet1.vnet_subnets[0]
  network_security_group_id = module.vnet1-nsg.network_security_group_id
  }

// natgw association

resource "azurerm_subnet_nat_gateway_association" "subnettonatgw" {
  subnet_id      = module.vnet1.vnet_subnets[0]
  nat_gateway_id = module.natgw.id
}