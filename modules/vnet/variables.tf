variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

variable "location" {
  description = "Location of the infrastructure"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}
