variable "location" {
  description = "Location of the infrastructure"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VMs"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VMs"
  type        = string
  sensitive   = true
}

variable "sql_admin_username" {
  description = "Admin username for the SQL Server"
  type        = string
}

variable "sql_admin_password" {
  description = "Admin password for the SQL Server"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}
