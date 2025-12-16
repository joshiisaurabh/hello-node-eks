terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  terraform {
  backend "s3" {
    bucket  = "my-terraform-state-bucket-42805"
    key     = "hello-node-eks/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}
}

provider "aws" {
  region = var.aws_region
}
