terraform {
  required_version = ">= 0.14"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.38.0"
    }
  }
  backend "s3" {
    region               = "us-east-1"
    bucket               = "flaskapi-terraform-state-100"
    key                  = "terraform.tfstate"
    workspace_key_prefix = "terraform"
  }
  #aws s3api create-bucket --bucket flaskapi-terraform-state-100 --region us-east-1
}

provider "aws" {
  region = "us-east-1"
}
