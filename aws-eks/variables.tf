variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "clustername" {
  type        = string
  default     = "EKS-Sandertesting"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_private_subnets" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "vpc_public_subnets" {
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "eksnodegroupinstance" {
  type        = list(string)
  default     = ["t3.medium"]
}