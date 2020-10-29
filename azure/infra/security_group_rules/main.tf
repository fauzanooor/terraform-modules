resource "azurerm_network_security_rule" "buburtimor-sg-rule" {
    name                          = var.sg-rule-name
    priority                      = var.sg-rule-priority
    direction                     = var.sg-rule-direction
    access                        = var.sg-rule-access
    protocol                      = var.sg-rule-protocol
    source_port_range             = var.sg-rule-source_port_range
    destination_port_ranges       = var.sg-rule-destination_port_ranges
    source_address_prefixes       = var.sg-rule-source_address_prefixes
    destination_address_prefix  = var.sg-rule-destination_address_prefix
    resource_group_name           = var.resource_group_name
    network_security_group_name   = var.sg-name
}