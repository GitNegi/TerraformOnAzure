variable "name" {}
variable "location" {}
variable "vnetcidr" {}
variable "pub_subnet1_cidr" {}
variable "pub_subnet2_cidr" {}
variable "pvt_subnet3_cidr" {}


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

