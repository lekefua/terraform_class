resource "azurerm_resource_group" "tf-rg-philippe" {
  name     = "mcit_rg_philippe"
  location = "canadacentral"
}

resource "azurerm_mssql_server" "tf-test-mysqlserver" {
  name                         = "tftestsqlserver"
  resource_group_name          = azurerm_resource_group.tf-rg-philippe.name
  location                     = azurerm_resource_group.tf-rg-philippe.location
  version                      = "12.0"
  administrator_login          = "admin"
  administrator_login_password = "goodpassword123"
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = "sql-admin"
    object_id      = "fbfaea3c-9c12-4a9c-99cd-d119744d6825"
  }

  tags = {
    environment = "production"
  }
} 
  
resource "azurerm_sql_active_directory_administrator" "azuread-admin" {
  server_name         = "azurerm_sql_server.tf-test-mysqlserver.name"
  resource_group_name = "azurerm_resource_group.tf-rg-philippe.name"
  login               = "sql-admin"
  tenant_id=var.tenant_id
  object_id=var.object_id
}
