resource "azurerm_resource_group" "app_grp" {
  name      = var.app_resource_group_name
  location  = var.location
}