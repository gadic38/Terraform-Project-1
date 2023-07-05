
# Terraform Settings Block
terraform {
  # Terraform Version
  required_version = "~> 1.5.1"
  required_providers {
    # AWS Provider 
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    
  }
  }
  


# Provider Block
provider "aws" {
  region  = var.aws_region
  
}