resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content         = tls_private_key.key.private_key_openssh
  filename        = "private_key.pem"
  file_permission = "400"
}

locals {
  public_ssh_key = tls_private_key.key.public_key_openssh
}

resource "azurerm_linux_virtual_machine" "server" {
  name                            = var.name
  location                        = var.location
  resource_group_name             = azurerm_resource_group.rg.name
  network_interface_ids           = [azurerm_network_interface.nic.id]
  size                            = var.vm_size
  computer_name                   = var.name
  admin_username                  = var.vm_user
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.vm_user
    public_key = local.public_ssh_key
  }

  os_disk {
    name                 = "${local.vm_os_disk_name}-disk"
    caching              = var.vm_os_disk_caching
    storage_account_type = var.vm_os_disk_storage_acc_type
  }

  source_image_reference {
    publisher = var.linux_vm_image_publisher
    offer     = var.linux_vm_image_offer
    sku       = var.image_sku
    version   = "latest"
  }

  identity {
    type = var.vm_identity_type
  }

  tags = var.vm_tags
}