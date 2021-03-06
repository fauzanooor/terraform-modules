resource "azurerm_network_security_group" "buburtimor-sg" {
  name                  = "sg_${var.workload}_${var.project}"
  location              = var.location
  resource_group_name   = var.resource_group_name
}

resource "azurerm_network_interface" "buburtimor-nic" {
    count               = var.countnumber
    name                = "nic_${var.workload}_${var.project}_${count.index}"
    location            = var.location
    resource_group_name = var.resource_group_name

    ip_configuration {
        name                          = "primary"
        subnet_id                     = var.nic_subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_network_interface_security_group_association" "buburtimor-nic-sg" {
    count                        = length(azurerm_network_interface.buburtimor-nic.*.id)
    network_interface_id         = element(azurerm_network_interface.buburtimor-nic.*.id, count.index)
    network_security_group_id    = azurerm_network_security_group.buburtimor-sg.id
}

resource "azurerm_virtual_machine" "buburtimor-vm" {
    count                   = var.countnumber
    name                    = "${var.workload}-${var.project}-${count.index}"
    location                = var.location
    resource_group_name     = var.resource_group_name
    network_interface_ids   = [azurerm_network_interface.buburtimor-nic["${count.index}"].id]
    vm_size                 = var.vm_size

    delete_os_disk_on_termination = var.delete_os_disk_on_termination
    delete_data_disks_on_termination = var.delete_data_disks_on_termination

    storage_image_reference {
        publisher = var.publisher
        offer     = var.offer
        sku       = var.sku
        version   = var.version_image
    }

    storage_os_disk {
        name              = "osdisk_${var.workload}-${var.project}-${count.index}"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = var.managed_disk_type
    }

    os_profile {
        computer_name  = "${var.workload}-${var.project}-${count.index}"
        admin_username = var.admin_username
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys    {
            path = "/home/${var.admin_username}/.ssh/authorized_keys"
            key_data = var.ssh_pub_key
        }
    }
}