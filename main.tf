provider "azurerm" {
  features {}
}

module "resourcegroup" {
  source         = "./modules/resourcegroup"
  name           = var.name
  location       = var.location
}

module "networking" {
  source         = "./modules/networking"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  vnetcidr       = var.vnetcidr
  pub_subnet1_cidr = var.pub_subnet1_cidr
  pub_subnet2_cidr = var.pub_subnet2_cidr
  pvt_subnet3_cidr = var.pvt_subnet3_cidr
#   websubnetcidr  = var.websubnetcidr
#   appsubnetcidr  = var.appsubnetcidr
#   dbsubnetcidr   = var.dbsubnetcidr
}

module "securitygroup" {
  source         = "./modules/securitygroup"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name 
  pub_subnet1_id = module.networking.pub_subnet1_id
  pub_subnet2_id = module.networking.pub_subnet2_id
  pvt_subnet3_id = module.networking.pvt_subnet3_id 

#   web_subnet_id  = module.networking.websubnet_id
#   app_subnet_id  = module.networking.appsubnet_id
#   db_subnet_id   = module.networking.dbsubnet_id
}


module "compute" {
  source         = "./modules/compute"
  location = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  
  # public subnet 1 window system configuration
  pub_subnet1_id = module.networking.pub_subnet1_id
  pub1_host_name = var.pub1_host_name
  pub1_username = var.pub1_username
  pub1_os_password = var.pub1_os_password

  # public subnet2 for window vm 
  pub_subnet2_id = module.networking.pub_subnet2_id
  pub2_host_name = var.pub2_host_name
  pub2_username = var.pub2_username
  pub2_os_password = var.pub2_os_password


  # private subnet3 for linux vm
  pvt_subnet3_id = module.networking.pvt_subnet3_id
  pvt3_host_name = var.pvt3_host_name
  pvt3_username = var.pvt3_username
  pvt3_os_password = var.pvt3_os_password

}
