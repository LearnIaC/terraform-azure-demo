terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.14.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id
  client_id       = var.azure_sp_client_id
  client_secret   = var.azure_sp_client_secret
  features {}
}

resource "azurerm_resource_group" "app_grp" {
  name      = var.resource_group_name
  location  = var.location
}