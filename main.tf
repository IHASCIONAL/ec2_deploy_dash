terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "ihas-teste-terraform"
    key     = "terraform-test.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "ihas-teste-terraform" # S3 bucket names cannot have underscores

  tags = {
    Name        = "Meu Primeiro Bucket"
    Environment = "Dev"
  }

}
