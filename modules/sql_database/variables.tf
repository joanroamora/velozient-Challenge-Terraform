variable "sql_server_name" {
  description = "Name of the SQL Server"
  type        = string
}

variable "sql_database_name" {
  description = "Name of the SQL Database"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the infrastructure"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the SQL Server"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the SQL Server"
  type        = string
  sensitive   = true
}

variable "app_subnet_prefix" {
  description = "CIDR prefix of the app subnet"
  type        = string
}
