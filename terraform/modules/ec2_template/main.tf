terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

# Resource for the AWS instance
# ami-0cacde0588b3b78fb is the anisble slave node private image
resource "aws_instance" "instance1" {
  ami                         = "ami-0cacde0588b3b78fb"
  instance_type               = "t2.micro"
  # associate_public_ip_address = true
  subnet_id                   = "subnet-0766e30cb66ecd7bd"
  key_name                    = "Windows Key"
  vpc_security_group_ids      = ["sg-052f19b52fcb7a40e", "sg-0fa542067c43747bc", "sg-0623577abca4be1af"]

  tags = {
    Name = "Ansible_Slave_Node"
  }
}