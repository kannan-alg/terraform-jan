provider "aws" {
  region = "${var.region}"
}


terraform {
  backend "s3" {
    bucket         = "stsureshbab-987"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-evening"
  }
}
