variable "project" {}
variable "location" {
    default = "SoutheastAsia"
}
variable "address_space" {
    default = "10.0.0.0/16"
}
variable "subnet" {}
variable "address_prefixes" {
    default = ["10.0.0.0/24"]
}