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
  ami               = "ami-0b5eea76982371e91"
  instance_type     = "t2.medium"
  availability_zone = "us-east-1a"
  key_name          = "key1"
  security_groups   = ["openall"]
  user_data         = <<-EOF
    #!/bin/bash
    sudo yum install python-pip
    EOF
  for_each = {
    Sonar  = "instance-1"
    Nexus   = "Instance-2"
  }
  tags = {
    "Name" = "${each.key}"
    "tag" = "${each.key}-${each.value}"    
  }
}
