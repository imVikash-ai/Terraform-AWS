terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.16.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Project     = "Terraform-AWS"
      Topic       = "Type-Constraints"
      ManagedBy   = "Terraform"
      Environment = var.environment
    }
  }
}