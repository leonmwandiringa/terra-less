terraform {
  required_version = ">= 1.0"
  # breaking changes in version 4.0 and above, needs to be researched on
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.6.0"
    }
  }
}