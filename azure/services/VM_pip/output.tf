output "private_ip_addresses" {
  value = azurerm_network_interface.buburtimor-nic.*.private_ip_address
}

output "public_ip_addresses" {
  value = azurerm_public_ip.buburtimor-pip.*.ip_address
}

output "security_group_name" {
  value = azurerm_network_security_group.buburtimor-sg.*.name
}