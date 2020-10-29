
output "nic_subnet_id" {
  value = azurerm_subnet.buburtimor-subnet.*.id
}