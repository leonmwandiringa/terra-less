module "terra_less_api_gateway_log_group" {
  source = "techadontech/logs/cloudwatch"
  log_group_name = "terra-less-log-group"
  retention_in_days = 7
  global_tags = merge({"Name" = "terra less Api gateway log group"}, var.global_tags)
}

################ terra less api gateway ###########################
module "terra_less_api_gateway" {
  source = "techadontech/gateway-rest-api/api"
  name          = "terra-less"
  xray_tracing_enabled = true
  metrics_enabled = true
  log_group_arn = module.terra_less_api_gateway_log_group.arn
  cloudwatch_role_arn = module.terra_less_api_gateway_log_group.arn
  openapi_config = {
    openapi = "3.0.1"
    info = {
      title   = "terra-less"
      version = "1.0"
    }
    paths = {
      "/test" = {
        get = {
          x-amazon-apigateway-integration = {
            httpMethod           = "GET"
            payloadFormatVersion = "1.0"
            type                 = "HTTP_PROXY"
            uri                  = "https://ip-ranges.amazonaws.com/ip-ranges.json"
          }
        }
      }
    }
  }
  depends_on = [
    module.terra_less_api_gateway_log_group
  ]
  tags = merge(var.global_tags, {
    "Name" = "terra-less gateway rest"
  })
}