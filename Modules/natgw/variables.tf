variable "rgname" {
  description = "Resource Group to deploy NAT gateway into"
}

variable "natgw_depends_on" {
  # the value doesn't matter; we're just using this variable
  # to propagate dependencies.
  type    = any
  default = []
}