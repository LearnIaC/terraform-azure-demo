resource "azuredevops_project" "vue_app_ci_demo" {
  name               = "VueAppCIDemo"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
  description        = "Managed by Terraform"
  features = {
    "testplans" = "disabled"
    "artifacts" = "disabled"
  }
}

resource "azuredevops_serviceendpoint_azurerm" "example" {
  project_id            = azuredevops_project.vue_app_ci_demo.id
  service_endpoint_name = "Example AzureRM"
  description           = "Managed by Terraform"
  credentials {
    serviceprincipalid  = var.azure_sp_client_id
    serviceprincipalkey = var.azure_sp_client_secret
  }
  azurerm_spn_tenantid      = var.azure_tenant_id
  azurerm_subscription_id   = var.azure_subscription_id
  azurerm_subscription_name = "Azure subscription 1"
}