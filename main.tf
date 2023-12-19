resource "azurerm_resource_group" "tf-test-philippe" {
  name     = "mcit_resource_group_philippe"
  location = "canadacentral"
}


resource "azurerm_storage_account" "tf-storageaccount" {
  name                     = "samcitphil2023"
  resource_group_name      = azurerm_resource_group.tf-test-philippe.name
  location                 = azurerm_resource_group.tf-test-philippe.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_mssql_server" "mysql-server" {
  name                         = "phil-mysqlserver"
  resource_group_name          = azurerm_resource_group.tf-test-philippe.name
  location                     = azurerm_resource_group.tf-test-philippe.location
  version                      = "12.0"
  administrator_login          = "admin"
  administrator_login_password = "really_good_password"
}

resource "azurerm_mssql_database" "phil_mysql-db" {
  name           = "phil-mcit-db"
  server_id      = azurerm_mssql_server.mysql-server.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "S0"
  zone_redundant = true
  enclave_type   = "VBS"

  tags = {
    foo = "bar"
  }
}
