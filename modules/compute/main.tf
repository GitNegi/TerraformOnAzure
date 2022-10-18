resource "azurerm_public_ip" "public_ip1" {
  name                = "PublicIp1"
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method   = "Dynamic"
}

resource "azurerm_public_ip" "public_ip2" {
  name                = "PublicIp2"
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method   = "Dynamic"
}



resource "azurerm_network_interface" "pub-subnet1-net-interface" {
    name = "pub-subnet1-network"
    resource_group_name = var.resource_group
    location = var.location

    ip_configuration{
        name = "pub-subnet1-config"
        subnet_id = var.pub_subnet1_id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.public_ip1.id
    }
}



resource "azurerm_windows_virtual_machine" "pub-sub1-wvm" {
  name                  = "mywindows1"
  location              = var.location
  resource_group_name   = var.resource_group
  network_interface_ids = [azurerm_network_interface.pub-subnet1-net-interface.id]
  size                  = "Standard_B1s"
  admin_username = var.pub1_username
  admin_password = var.pub1_os_password
  



  os_disk {
    name                 = "myOswindowsDisk1"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

 source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }



tags = {
     environment = "Window-server-vm-1"
   }

}


resource "azurerm_network_interface" "pub-subnet2-net-interface" {
    name = "pub-subnet2-network"
    resource_group_name = var.resource_group
    location = var.location

    ip_configuration{
        name = "pub-subnet2-config"
        subnet_id = var.pub_subnet2_id
        private_ip_address_allocation = "Dynamic"
          public_ip_address_id = azurerm_public_ip.public_ip2.id
    }
}



resource "azurerm_windows_virtual_machine" "pub-sub2-wvm" {
  name                  = "mywindows2"
  location              = var.location
  resource_group_name   = var.resource_group
  network_interface_ids = [azurerm_network_interface.pub-subnet2-net-interface.id]
  size                  = "Standard_B1s"
  admin_username = var.pub2_username
  admin_password = var.pub2_os_password  



  os_disk {
    name                 = "myOswindowsDisk2"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

 source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }



tags = {
     environment = "Window-server-vm-2"
   }

}



resource "azurerm_network_interface" "pvt-subnet3-net-interface" {
    name = "pvt-subnet3-network"
    resource_group_name = var.resource_group
    location = var.location

    ip_configuration{
        name = "pvt-subnet3-config"
        subnet_id = var.pvt_subnet3_id
        private_ip_address_allocation = "Dynamic"
    }
}




resource "azurerm_linux_virtual_machine" "pvt-sub3-vm" {
  name                  = "linux-lvm"
  location              = var.location
  resource_group_name   = var.resource_group
  network_interface_ids = [azurerm_network_interface.pvt-subnet3-net-interface.id]
  size                  = "Standard_B1ls"



  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = var.pvt3_host_name
  admin_username                  = var.pvt3_username
  admin_password = var.pvt3_os_password
  disable_password_authentication = false



tags = {
     environment = "Ubuntu_TF_Test1"
   }

}