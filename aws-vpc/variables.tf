
variable "azs" {
  type    = list(string)
  default = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]

}

variable "name" {
  type    = string
  default = "test vpc"

}

variable "cidr" {
  type = string
  default = "172.31.0.0/16"
}

variable "private_subnets" {
  type    = list(string)
  default = ["172.31.10.0/24", "172.31.20.0/24", "172.31.30.0/24"]
}

variable "public_subnets" {
  type    = list(string)
  default = ["172.31.40.0/24", "172.31.50.0/24", "172.31.60.0/24"]
}