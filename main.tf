resource "azurerm_resource_group" "tf-rg-philippe" {
  name     = "mcit_rg_philippe"
  location = "canadacentral"
}

resource "azurerm_mssql_server" "tf-test-mysqlserver" {
  name                         = "tftestsqlserver"
  resource_group_name          = azurerm_resource_group.tf-rg-philippe.name
  location                     = azurerm_resource_group.tf-rg-philippe.location
  version                      = "12.0"
  administrator_login          = var.db_user
  administrator_login_password = var.db_password
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = "sql-admin"
    object_id      =var.object_id
  }

  tags = {
    environment = "production"
  }
} 

resource "azurerm_storage_account" "tf-storageaccount" {
  name                     = "${var.MyName}storageaccount${var.countNumber}"
  resource_group_name      = azurerm_resource_group.tf-rg-philippe.name
  location                 = azurerm_resource_group.tf-rg-philippe.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  cross_tenant_replication_enabled =var.cross_tenant_replication

  tags = {
    environment = "staging"
  }
}
