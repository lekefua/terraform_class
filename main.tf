resource "azurerm_resource_group" "tf-rg-philippe" {
  name     = "mcit_rg_philippe"
  location = "canadacentral"
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

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
