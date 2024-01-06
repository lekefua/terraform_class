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

locals {
name_of_storage_acc_list = ["philippemcitredston1", "philippemcitredston2","philippemcitredston3", "philippemcitredston4", "philippemcitredston5"]
}

resource "azurerm_kubernetes_cluster" "batchabcd" {
  for_each            = {for cluster in local.name_of_storage_acc_list: cluster=>cluster}
  name                = "${var.prefix}cluster"
  location            = azurerm_resource_group.tf-rg-philippe.location
  resource_group_name = azurerm_resource_group.tf-rg-philippe.name
  dns_prefix          = "exampleaks1"
  }
}
