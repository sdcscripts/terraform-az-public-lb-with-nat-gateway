module "lb1" {
  source              = "./modules/lb"
  resource_group_name = module.vnet1.vnet_rg_name
  location            = var.location
  prefix              = "lb"

  lb_port = {
    http = ["80", "Tcp", "80"]
  }
}

resource "azurerm_network_interface_backend_address_pool_association" "linuxvm1tolb" {
  network_interface_id    = module.linuxvm1.vmnicipid
  ip_configuration_name   = "mynicconfiguration"
  backend_address_pool_id = module.lb1.azurerm_lb_backend_address_pool_id
}

resource "azurerm_network_interface_backend_address_pool_association" "linuxvm2tolb" {
  network_interface_id    = module.linuxvm2.vmnicipid
  ip_configuration_name   = "mynicconfiguration"
  backend_address_pool_id = module.lb1.azurerm_lb_backend_address_pool_id
}