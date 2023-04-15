module "cors" {
  source = "squidfunk/api-gateway-enable-cors/aws"
  version = "0.3.3"

  api_id          = var.rest-id
  api_resource_id = var.rest-resourceid
}
