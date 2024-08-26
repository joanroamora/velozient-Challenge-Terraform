terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-backend"
    storage_account_name = "terraformstate"
    container_name       = "dev"
    key                  = "terraform.tfstate"
  }
}
