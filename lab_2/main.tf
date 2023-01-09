terraform {
  required_version = ">= 1.1.0"
  required_providers {
    aws = {
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = var.region
}

resource "aws_instance" "example" {
  ami = lookup(var.ami_instance, var.region)
  #ami = "ami-0e81aa4c57820bb57"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.secgroup-ssh.id]

  tags     = { LabName = "2.Workflow" }
  key_name = aws_key_pair.generated_key.key_name
}

# Create a TLS private key resource
resource "tls_private_key" "mykey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
# Create an AWS 'key pair' resource usable for ssh from the TLS private key

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  # public_key = tls_private_key.mykey.public_key_openssh
  public_key = file(pathexpand("~/.ssh/id_rsa.pub"))
}

resource "aws_security_group" "secgroup-ssh" {
  name = "simple security group - for ssh Ingress only"
  # Enable incoming ssh connection:
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "local_file" "pem_key" {
  filename        = "key.pem"
  content         = tls_private_key.mykey.private_key_pem
  file_permission = 0600
}