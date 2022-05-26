module "terra_less_ssm_parameter_store" {
  source = "techadontech/store/parameter"
  parameters = [
    {
      "parameter_name" = "/terra_less/dev/api_gateway/id"
      "parameter_type" = "String"
      "parameter_value" = "${module.terra_less_api_gateway.id}"
      "parameter_description" = "api gateway id"
    },
    {
      "parameter_name" = "/terra_less/dev/api_gateway/root_resource_id"
      "parameter_type" = "String"
      "parameter_value" = "${module.terra_less_api_gateway.root_resource_id}"
      "parameter_description" = "api gateway root_resource_id"
    },
    {
      "parameter_name" = "/terra_less/dev/api_gateway/arn"
      "parameter_type" = "String"
      "parameter_value" = "${module.terra_less_api_gateway.arn}"
      "parameter_description" = "api gateway arn"
    },
  ]
}