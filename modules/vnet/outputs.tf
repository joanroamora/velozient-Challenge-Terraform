output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "web_subnet_id" {
  value = azurerm_subnet.web_subnet.id
}

output "app_subnet_id" {
  value = azurerm_subnet.app_subnet.id
}

output "db_subnet_id" {
  value = azurerm_subnet.db_subnet.id
}

output "web_nsg_id" {
  value = azurerm_network_security_group.web_nsg.id
}

output "app_nsg_id" {
  value = azurerm_network_security_group.app_nsg.id
}

output "db_nsg_id" {
  value = azurerm_network_security_group.db_nsg.id
}
