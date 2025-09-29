# 1. Choose provider
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.14.1"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# 3. create id from random provider
resource "random_id" "unique_id" {
  byte_length = 10
}

# 4. create resource for S3
resource "aws_s3_bucket" "mytfbucket" {
    bucket = "mytfbucket-${random_id.unique_id.hex}"
}

# upload the data in s3 bucket
resource "aws_s3_object" "indexFile" {
    source = "./index.html"
    bucket = aws_s3_bucket.mytfbucket.bucket
    key="index.html"
    content_type = "text/html"
    
}

# create output block
output "unique_id" {
 value=random_id.unique_id.hex 
}
