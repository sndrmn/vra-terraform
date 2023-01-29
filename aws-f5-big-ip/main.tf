provider "aws" {
  region = "ap-southeast-2"
}

module bigip {
  source                 = "F5Networks/bigip-module/aws"
  prefix                 = "bigip-aws"
  ec2_key_name           = var.ec2_key_name
  mgmt_subnet_ids        = [{ "subnet_id" = "subnet-071604caaea13cf0c", "public_ip" = false, "private_ip_primary" =  ""}]
  mgmt_securitygroup_ids = ["sg-053ecf4c3c37a5e39"]
  ec2_instance_type      = var.size

}