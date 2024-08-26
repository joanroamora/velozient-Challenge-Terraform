resource "azurerm_network_security_group" "web_nsg" {
  name                = "web-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_group" "app_nsg" {
  name                = "app-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_group" "db_nsg" {
  name                = "db-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Allow web inbound traffic on ports 80 and 443
resource "azurerm_network_security_rule" "allow_web_inbound" {
  name                        = "allow_web_inbound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["80", "443"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.web_nsg.name
}

# Allow web subnet to access app subnet
resource "azurerm_network_security_rule" "allow_app_inbound" {
  name                        = "allow_app_inbound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["*"]
  source_address_prefix       = azurerm_subnet.web_subnet.address_prefixes[0]
  destination_address_prefix  = azurerm_subnet.app_subnet.address_prefixes[0]
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.app_nsg.name
}

# Allow app subnet to access db subnet
resource "azurerm_network_security_rule" "allow_db_inbound" {
  name                        = "allow_db_inbound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["1433"]
  source_address_prefix       = azurerm_subnet.app_subnet.address_prefixes[0]
  destination_address_prefix  = azurerm_subnet.db_subnet.address_prefixes[0]
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.db_nsg.name
}
