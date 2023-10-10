variable "rg_name" {
    type = string
    default = "default-rg"
  
}

variable "location" {
    type = string
    default = "South India"
  
}
variable "vnet_name" {
    type = string
    default = "default-vnet"
  
}

variable "address_space" {
    type = list(string)
    default = ["10.0.0.0/16"]
  
}

variable "subnet_name" {
    type = string
    default = "default-subnet"
  
}

variable "address_prefixes" {
    type = list(string)
    default = ["10.0.0.0/24"]
  
}

variable "public_ip_name" {
    type = string
    default = "linuxvm_publicip"
  
}

variable "nic_name" {
    type = string
    default = "linuxvm_nic"
  
}

variable "linuxvm_name" {
    type = string
    default = "linuxvmmsi"
  
}

variable "admin_username" {
    type = string
    default = "azureuser"
  
}

variable "admin_password" {
    type = string
    description = "Add admin password"
  
}

variable "size" {
    type = string
    default = "Standard_DS1_v2"
  
}

variable "publisher" {
    type = string
    default = "Redhat"
  
}

variable "offer" {
    type = string
    default = "RHEL"
  
}

variable "sku" {
    type = string
    default = "83-gen2"
  
}