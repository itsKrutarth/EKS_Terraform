terraform {
    
    required_version = ">=1.12.0"

  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">=6.0"
    }
    random = {
        source = "hashicorp/random"
        version = "~>3.0"
    }
  }

#   backend "s3" {
#     bucket = aws_s3_bucket.backendBucket.Name
#     key = "eks.dev/terraform.tfstate"
#     region = "us-east-2"
#     encrypt = true
#     use_lockfile = true
#   }
}


provider "aws" {
  region = "us-east-2"
}