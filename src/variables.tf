///////// Global ///////
variable "global_tags" {
  description = "All Cloud network global tags for terra-less"
  type = map(string)
  default = {
    "Author" = "0xL3onardo",
    "Environment" = "{{ENVIRONMENT}}",
    "Region" = "{{AWS_REGION}}"
    "Project" = "{{PROJECT_NAME}}",
    "Provisioner" = "Terraform"
  }
}
