terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# create a S3 bucket
resource "aws_s3_bucket" "first_bucket-01" {
  bucket = "s3-bucket-terraform-vikash-2024"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}