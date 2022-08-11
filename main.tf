terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.16.0"
    }
    azuredevops = {
      source = "microsoft/azuredevops"
      version = "0.2.2"
    }
  }
  //configured via cli
  //ex: terraform init -backend-config example.config.tfvars
  backend "azurerm" {} 
}

provider "azurerm" {
  # Configuration options
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  features {}
}

provider "azuredevops" {
  # Configuration options
  org_service_url = var.azuredevops_org_url
  personal_access_token = var.azuredevops_pat
}