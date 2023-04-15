provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_api_gateway_integration_response" "post" {
  rest_api_id = var.rest
  resource_id = var.resource
  http_method = "POST"
  status_code = "200"
}

resource "aws_api_gateway_method_response" "post" {
  rest_api_id = var.rest
  resource_id = var.resource
  status_code = "200"
  http_method = "POST"

  response_models = {
    "application/json" = "Empty"
  }
}