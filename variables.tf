variable "projidprefix" {
  description = "Prefix to use for resource group creation"
}

variable "location" {
  description = "Location for all resources"
}

variable "networkrgname" {
  description = "Location for all resources"
}

variable "computergname" {
  description = "Location for all resources"
}

variable "linuxvm1_hostname" {
  description = "Hostname for virtual machine"
}

variable "linuxvm2_hostname" {
  description = "Hostname for virtual machine"
}

variable "vm_admin_user" {
  description = "Username for Virtual Machines"
}

variable "vm_admin_pwd" {
  description = "Password for Virtual Machines"
 }

variable "vm_size" {
  description = "Size of the VMs"
 }

variable "vnet1_name" {
  description = "Name of vnet1"
 }

variable "nsg_rg_name" {
  description = "nsg resource group name"
}