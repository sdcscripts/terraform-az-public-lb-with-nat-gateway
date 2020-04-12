# Public VM output to user
output "vm1_dns_label" {
  value = module.linuxvm1.public_ip_dns_name
}

output "vm2_dns_label" {
  value = module.linuxvm2.public_ip_dns_name
}
output "vm1_username" {
  value = var.vm_admin_user
}

output "vm1_password" {
  value = var.vm_admin_pwd
}

output "lb_dns_label" {
  value = module.lb1.public_ip_dns_name
}