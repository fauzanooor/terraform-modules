resource "azurerm_resource_group" "buburtimor-rg" {
    name        = "buburtimor_rg_${var.project}"
    location    = var.location
}

resource "azurerm_virtual_network" "buburtimor-vnet" {
    name                    = "vnet_${var.project}"
    resource_group_name     = azurerm_resource_group.buburtimor-rg.name
    location                = var.location
    address_space           = var.address_space
}

resource "azurerm_subnet" "buburtimor-subnet" {
  name                 = var.subnet
  resource_group_name  = azurerm_resource_group.buburtimor-rg.name
  virtual_network_name = azurerm_virtual_network.buburtimor-vnet.name
  address_prefix       = var.address_prefixes
}