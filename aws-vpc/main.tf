module "vpc" {
  source  = "github.com/terraform-aws-modules/terraform-aws-vpc" 

  name = var.name

  cidr = var.cidr

  azs             = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
  private_subnets = var.privsubnets
  public_subnets  = var.pubsubnets

  enable_ipv6 = true

  enable_nat_gateway = false
  single_nat_gateway = false

  vpc_tags = {
    Name = var.name
  }
}