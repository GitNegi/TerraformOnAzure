variable "resource_group" {}
variable "location" {}
variable "pub_subnet1_id" {}
variable "pub_subnet2_id" {}
variable "pvt_subnet3_id" {}


# public vm1 variables (window server1)
variable "pub1_host_name"{}
variable "pub1_username" {}
variable "pub1_os_password" {}

# public vm2 variables (window server2)
variable "pub2_host_name"{}
variable "pub2_username" {}
variable "pub2_os_password" {}

# private vm3 variables (linux server)
variable "pvt3_host_name"{}
variable "pvt3_username" {}
variable "pvt3_os_password" {}

# variable "web_subnet_id" {}
# variable "app_subnet_id" {}
# variable "web_host_name"{}
# variable "web_username" {}
# variable "web_os_password" {}
# variable "app_host_name"{}
# variable "app_username" {}
# variable "app_os_password" {}
