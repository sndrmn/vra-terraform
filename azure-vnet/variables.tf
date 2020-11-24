variable "network" {
}

variable "rgname" {
}

variable "vnet_address" {
  type    = list(string)
  default = ["172.31.0.0/16"]
}

variable "subnetname" {
}

variable "subnetname2" {
}

variable "subnet_address" {
  type    = list(string)
}

variable "subnet_address2" {
  type    = list(string)
}