#api gateway rest api
output "created_date" {
  description = "The date the REST API was created"
  value       = module.terra_less_api_gateway.created_date
}
output "id" {
  description = "The ID of the REST API"
  value       = module.terra_less_api_gateway.id
}

output "root_resource_id" {
  description = "The resource ID of the REST API's root"
  value       = module.terra_less_api_gateway.root_resource_id
}
output "arn" {
  description = "The ARN of the REST API"
  value       = module.terra_less_api_gateway.arn
}