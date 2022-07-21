resource "azurerm_resource_group" "app_grp" {
  name      = var.resource_group_name
  location  = var.location
}