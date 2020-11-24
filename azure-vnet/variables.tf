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

variable "subnet_address" {
}