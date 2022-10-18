resource "azurerm_network_security_group" "pub1-nsg" {
  name                = "public-subnet1-nsg"
  location            = var.location
  resource_group_name = var.resource_group
  
  security_rule {
    name                       = "window-rdp-rule-1"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "3389"
  }
  
}

resource "azurerm_subnet_network_security_group_association" "pub-nsg-subnet1" {
  subnet_id                 = var.pub_subnet1_id
  network_security_group_id = azurerm_network_security_group.pub1-nsg.id
}

resource "azurerm_network_security_group" "pub2-nsg" {
    name = "public-subnet2-nsg"
    location = var.location
    resource_group_name = var.resource_group

    security_rule {
        name = "window-rdp-rule-1"
        priority = 100
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_address_prefix = "*"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "3389"
    }
    
 
}

resource "azurerm_subnet_network_security_group_association" "pub-nsg-subnet2" {
  subnet_id                 = var.pub_subnet2_id
  network_security_group_id = azurerm_network_security_group.pub2-nsg.id
}


resource "azurerm_network_security_group" "pvt3-nsg" {
    name = "private-subnect3-nsg"
    location = var.location
    resource_group_name = var.resource_group

    security_rule {
        name = "linux-ssh-rule-1"
        priority = 101
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_address_prefix = "*"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "22"
    }
    
   
    

}

resource "azurerm_subnet_network_security_group_association" "pvt-nsg-subnet3" {
  subnet_id                 = var.pvt_subnet3_id
  network_security_group_id = azurerm_network_security_group.pvt3-nsg.id
}
