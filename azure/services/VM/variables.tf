variable "project" {}
variable "workload" {}
variable "countnumber" {}
variable "location" {
    default = "SoutheastAsia"
}
variable "nic_subnet_id" {}
variable "resource_group_name" {}
variable "vm_size" {}
variable "delete_data_disks_on_termination" {
    default = "false"
}
variable "delete_os_disk_on_termination" {
    default = "false"
}
variable "publisher" {}
variable "offer" {}
variable "sku" {}
variable "version_image" {
    default = "latest"
}
variable "managed_disk_type" {
    default = "Standard_LRS"
}
variable "admin_username" {}
variable "ssh_pub_key" {}