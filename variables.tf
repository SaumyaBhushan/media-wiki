########################################
# Virtual Network and Subnet variables #
########################################

variable "vnet" {
  description = "VNet name"
  type        = string
  default     = "test"
}

variable "vnet_rg" {
  description = "Resource Group for Virtual Network"
  type        = string
  default     = "test-rg"
}

variable "subnet" {
  description = "Subnet name"
  type        = string
  default     = "test"
}

###############################################
# Name, Resource and Location variables #
###############################################
variable "name" {
  type        = string
  description = "Name Substring for the resources"
  default     = "test"
}

variable "location" {
  type        = string
  description = "Location of the resources"
  default     = "eastus"
}

###############################
# Network Interface variables #
###############################
variable "nic_ip_config_private_ip_addr_allocation" {
  description = "Network Interface IP Config Private IP Address Allocation"
  type        = string
  default     = "Dynamic"
}

variable "vm_size" {
  description = "Virtual Machine Size"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "vm_user" {
  description = "Name of the user"
  type        = string
  default     = "azure_user"
}

variable "vm_os_disk_caching" {
  type    = string
  default = "ReadWrite"
}

variable "vm_os_disk_storage_acc_type" {
  type    = string
  default = "Premium_LRS"
}

variable "vm_source_image_reference_sku" {
  type    = string
  default = "22_04-lts-gen2"
}

variable "vm_identity_type" {
  type    = string
  default = "SystemAssigned"
}

variable "username" {
  description = "The username for the virtual machine"
  type        = string
  default     = "azure_user"
}

variable "linux_vm_image_publisher" {
  type        = string
  description = "Virtual machine source image publisher"
  default     = "RedHat"
}
variable "linux_vm_image_offer" {
  type        = string
  description = "Virtual machine source image offer"
  default     = "RHEL"
}
variable "image_sku" {
  type        = string
  description = "SKU for latest image "
  default     = "9_3"
}

variable "vm_tags" {
  type    = map(string)
  default = {
    Name        = "My bucket"
    Environment = "Development"
  }
}
