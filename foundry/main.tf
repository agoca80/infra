terraform {
  backend "s3" {
    key    = "terraform/foundry.tfstate"
    region = "eu-west-1"
  }

  required_providers {
    aws = "5.40.0"
  }

  required_version = "1.7.3"
}

provider "aws" {
  default_tags {
    tags = var.tags
  }
}

module "foundry" {
  source = "git@github.com:agoca80/aws-foundry.git"

  config      = var.config
  environment = var.environment
  name        = var.name
  tags        = var.tags
}

output "instance" {
  value = module.foundry.public_dns
}
