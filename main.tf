# Terraform Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider Block
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# Create EC2 Instance
resource "aws_instance" "my-ec2-vm" {
  ami               = "ami-079b5e5b3971bd10d"
  instance_type     = "t2.medium"
  count = 2
  availability_zone = "us-east-1"
  for_each = {
    Sonar  = "instance-1"
    Nexus   = "Instance-2"
  }
  tags = {
    "Name" = "${each.key}"
    "tag" = "${each.key}-${each.value}"    
  }
}
