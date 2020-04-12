resource "azurerm_resource_group" "compute_rg" {
  name     = "${var.projidprefix}-${var.computergname}"
  location = var.location
}

module "linuxvm1" {
  source        = "./modules/linuxvmpublic"
  rgname        = azurerm_resource_group.compute_rg.name 
  subnetid      = module.vnet1.vnet_subnets[0]
  location      = var.location
  vmname        = var.linuxvm1_hostname
  adminusername = var.vm_admin_user
  vmpassword    = var.vm_admin_pwd
  vmsize        = var.vm_size
   }

module "linuxvm2" {
  source        = "./modules/linuxvmpublic"
  rgname        = azurerm_resource_group.compute_rg.name 
  subnetid      = module.vnet1.vnet_subnets[0]
  location      = var.location
  vmname        = var.linuxvm2_hostname
  adminusername = var.vm_admin_user
  vmpassword    = var.vm_admin_pwd
  vmsize        = var.vm_size
   }

  resource "azurerm_virtual_machine_extension" "vm1extension" {
  name                 = "hostname"
  virtual_machine_id   = module.linuxvm1.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"
 settings = <<SETTINGS
    {                         
        "fileUris": ["https://raw.githubusercontent.com/sdcscripts/terraform-az-firewallnva/master/supporting/webserver.sh"],
        "commandToExecute": "bash webserver.sh"
 
    }
SETTINGS

  } 

  resource "azurerm_virtual_machine_extension" "vm2extension" {
  name                 = "hostname2"
  virtual_machine_id   = module.linuxvm2.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"
 settings = <<SETTINGS
    {                         
        "fileUris": ["https://raw.githubusercontent.com/sdcscripts/terraform-az-firewallnva/master/supporting/webserver.sh"],
        "commandToExecute": "bash webserver.sh"
 
    }
SETTINGS
  } 