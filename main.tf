terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.14.0"
    }
    azuredevops = {
      source = "microsoft/azuredevops"
      version = "0.2.2"
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

provider "azuredevops" {
  # Configuration options
  org_service_url = var.azuredevops_org_url
  personal_access_token = var.azuredevops_pat
}