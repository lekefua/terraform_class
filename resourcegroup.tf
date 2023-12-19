resource "azurerm_resource_group" "tf-test-philippe" {
  name     = "mcit_resource_group_philippe"
  location = "canadacentral"
}

resource "azurerm_resource_group" "tf-test-philippe_2" {
  name     = "mcit_resource_group_philippe_2"
  location = "canadacentral"
}
