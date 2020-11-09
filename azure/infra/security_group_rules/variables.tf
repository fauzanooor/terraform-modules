variable "sg-rule-name" {}
variable "sg-rule-priority" {}
variable "sg-rule-direction" {
    default = "Inbound"
}
variable "sg-rule-access" {
    default = "allow"
}
variable "sg-rule-protocol" {
    default = "tcp"
}
variable "sg-rule-source_port_range" {
    default = "*"
}
variable "sg-rule-destination_port_ranges" {}
variable "sg-rule-source_address_prefixes" {
    default = ["*"]
}
variable "sg-rule-destination_address_prefix" {
    default = "*"
}
variable "resource_group_name" {}
variable "sg-name" {}
variable "sg_depends_on" {
    type = any
    default = null
}