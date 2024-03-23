locals {
  resource_group_name = "${var.name}-rg"
  nsg                 = "${var.name}-nsg"
  nic_name            = "${var.name}-nic"
  nic_ip_config_name  = "${var.name}-nic-ip-config"
  vm_computer_name    = replace(var.name, "-", "")
  vm_os_disk_name     = "${var.name}-os-disk"
  vnet                = "${var.name}-vnet"
  subnet              = "${var.name}-subnet"
}