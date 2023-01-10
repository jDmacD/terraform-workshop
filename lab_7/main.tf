terraform {
  # Enforce Terraform version to be 1.3.x
  required_version = "~> 1.3"
  # Enforce AWS Provider version to be 4.x
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = var.region
}
module "vpc_module" {
  source = "../modules/vpc"

  region = var.region
}
module "instance_module" {
  source = "../modules/instances"

  region = var.region
}