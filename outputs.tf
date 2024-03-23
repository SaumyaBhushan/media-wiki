output "server-private-ssh-key" {
  value     = tls_private_key.key.private_key_openssh
  sensitive = true
}

output "server-id" {
  value = azurerm_linux_virtual_machine.server.id
}

output "server" {
  value     = azurerm_linux_virtual_machine.server
  sensitive = true
}