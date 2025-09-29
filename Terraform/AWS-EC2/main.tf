
# 1.Choose provider from terraform registery and copy this code 
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.14.1"
    }
  }
}
provider "aws" {
  region = var.region
}

# 2.Create variable for region
variable "region" {
  description = "Value of region"
  default = "ap-south-1"
  type = string
}

# 3.create resource for EC2 instace
resource "aws_instance" "EC2Instance" {
  ami = "ami-066eb5725566530f0"
  instance_type = "t3.small"
  tags = {
    Name="MyFirstEC2Server-01"
  }
}

# 4.Create Output block
output "aws_instance_IP" {
  value = aws_instance.EC2Instance.public_ip
}
