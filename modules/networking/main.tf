resource "azurerm_virtual_network" "vnet01" {
  name                = "vnet01"
  resource_group_name = var.resource_group
  location            = var.location
  address_space       = [var.vnetcidr]
}

resource "azurerm_subnet" "pub-subnet1" {
  name                 = "pub-subnet1"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.pub_subnet1_cidr]
}

resource "azurerm_subnet" "pub-subnet2" {
  name                 = "pub-subnet2"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.pub_subnet2_cidr]
}

resource "azurerm_subnet" "pvt-subnet3" {
  name                 = "pvt-subnet3"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.pvt_subnet3_cidr]
}
