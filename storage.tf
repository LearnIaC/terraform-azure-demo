resource "azurerm_storage_account" "app_storage" {
  name                            = "tfdemostorage2022"
  allow_nested_items_to_be_public = true
  resource_group_name             = azurerm_resource_group.app_grp.name
  location                        = azurerm_resource_group.app_grp.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
}

resource "azurerm_storage_container" "website_container" {
  name                  = "website"
  storage_account_name  = azurerm_storage_account.app_storage.name
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "index" {
  name                    = "index.html"
  storage_account_name    = azurerm_storage_account.app_storage.name
  storage_container_name  = azurerm_storage_container.website_container.name
  type                    = "Block"
  source                  = "index.html"
  content_type            = "text/html"
}