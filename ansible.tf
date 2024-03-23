resource "local_file" "inventory_file" {
  filename = "inventory.ini"
  content  = <<-EOT
    ${azurerm_linux_virtual_machine.server.public_ip_address}  ansible_ssh_user=azure_user ansible_ssh_private_key_file=private_key.pem
  EOT
}

resource "null_resource" "ansible_provisioner" {
  depends_on = [azurerm_linux_virtual_machine.server]

  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i inventory.ini install-mediawiki.yml"
  }
}