terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket-19"
    key    = "terraform-day19.tfstate"
    region = "us-east-1"
  }
}