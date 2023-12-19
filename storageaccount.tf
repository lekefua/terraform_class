resource "azurerm_storage_account" "tf-storageaccount" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.tf-test-philippe.name
  location                 = azurerm_resource_group.tf-test-philippe.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
