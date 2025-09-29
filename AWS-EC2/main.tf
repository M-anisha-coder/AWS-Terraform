# Choose provider
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.14.1"
    }
  }
}

# Create variable
variable "region" {
  description = "Value of region"
  default = "ap-south-1"
  type = string
}

provider "aws" {
  region = var.region
}

# create resource for ec2
resource "aws_instance" "EC2Instance" {
  ami = "ami-066eb5725566530f0"
  instance_type = "t3.small"
  tags = {
    Name="MyFirstEC2Server-01"
  }
}

# Create Output block
output "aws_instance_IP" {
  
value = aws_instance.EC2Instance.public_ip
}
