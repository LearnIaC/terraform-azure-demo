resource "azurerm_service_plan" "backend_app_service_plan" {
  name                = "backendDemoAppServicePlan"
  resource_group_name = azurerm_resource_group.app_grp.name
  location            = azurerm_resource_group.app_grp.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "backend_api_web_app" {
  name                = "backendApiWebApp"
  resource_group_name = azurerm_resource_group.app_grp.name
  location            = azurerm_resource_group.app_grp.location
  service_plan_id     = azurerm_service_plan.backend_app_service_plan.id
  https_only          = true
  site_config {
    always_on = false
    application_stack {
      dotnet_version = "6.0"
    }
    cors {
      allowed_origins = [ "*" ]
    }
  }
}