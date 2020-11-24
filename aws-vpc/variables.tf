
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
  default = "5.0.0.0/16"
}

variable "private_subnets" {
  type    = list(string)
  default = ["5.0.1.0/24", "5.0.2.0/24", "5.0.3.0/24"]
}

variable "public_subnets" {
  type    = list(string)
  default = ["5.0.101.0/24", "5.0.102.0/24", "5.0.103.0/24"]
}