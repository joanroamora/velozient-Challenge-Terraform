module "vnet" {
  source = "../../modules/vnet"
  
  vnet_name           = "prod-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "vm" {
  source = "../../modules/vm"
  
  location            = var.location
  resource_group_name = var.resource_group_name
  web_subnet_id       = module.vnet.web_subnet_id
  app_subnet_id       = module.vnet.app_subnet_id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  tags                = var.tags
}

module "sql_database" {
  source = "../../modules/sql_database"
  
  sql_server_name      = "prod-sql-server"
  sql_database_name    = "prod-sql-db"
  resource_group_name  = var.resource_group_name
  location             = var.location
  admin_username       = var.sql_admin_username
  admin_password       = var.sql_admin_password
  app_subnet_prefix    = module.vnet.app_subnet_id
}
