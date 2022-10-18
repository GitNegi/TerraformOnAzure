output "network_name" {
  value = azurerm_virtual_network.vnet01.name
  description = "Name of the Virtual network"
}

output "pub_subnet1_id" {
  value = azurerm_subnet.pub-subnet1.id
  description = "Id of websubnet in the network"
}

output "pub_subnet2_id" {
  value = azurerm_subnet.pub-subnet2.id
  description = "Id of appsubnet in the network"
}

output "pvt_subnet3_id" {
  value = azurerm_subnet.pvt-subnet3.id
  description = "Id of dbsubnet in the network"
}

