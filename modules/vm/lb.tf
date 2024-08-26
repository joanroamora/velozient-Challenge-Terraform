resource "azurerm_lb" "web_lb" {
  name                = "web-lb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = "web-lb-front"
    public_ip_address_id = azurerm_public_ip.web_lb_public_ip.id
  }
}

resource "azurerm_public_ip" "web_lb_public_ip" {
  name                = "web-lb-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_lb_backend_address_pool" "web_lb_backend" {
  name                = "web-backend-pool"
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.web_lb.id
}

resource "azurerm_lb_probe" "web_lb_health_probe" {
  name                = "web-health-probe"
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.web_lb.id
  protocol            = "Tcp"
  port                = 80
  interval_in_seconds = 5
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "web_lb_rule" {
  name                           = "http-rule"
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.web_lb.id
  frontend_ip_configuration_name = azurerm_lb.web_lb.frontend_ip_configuration[0].name
  backend_address_pool_id        = azurerm_lb_backend_address_pool.web_lb_backend.id
  probe_id                       = azurerm_lb_probe.web_lb_health_probe.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
}

resource "azurerm_network_interface_backend_address_pool_association" "web_lb_association" {
  count                    = 2
  network_interface_id     = element(azurerm_network_interface.web_nic.*.id, count.index)
  ip_configuration_name    = azurerm_network_interface.web_nic[0].ip_configuration[0].name
  backend_address_pool_id  = azurerm_lb_backend_address_pool.web_lb_backend.id
}
