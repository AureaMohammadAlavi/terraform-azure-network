data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}


resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = [var.address_space]
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = var.resource_group_name
}


resource "azurerm_subnet" "subnet" {
  for_each              = var.subnets
  name                  = each.key
  resource_group_name   = var.resource_group_name
  virtual_network_name  = azurerm_virtual_network.vnet.name
  address_prefixes      = [cidrsubnet(var.address_space, 8, each.value.number)]
}
