terraform {
  backend "s3" {
    key    = "terraform/ec2/ingress.tfstate"
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

module "ingress" {
  source = "git@github.com:agoca80/aws-ingress.git"

  availability_zones = var.availability_zones
  environment        = var.environment
  listeners          = var.listeners
  name               = var.name
  tags               = var.tags
}

module "listener" {
  for_each = var.listeners

  source = "git@github.com:agoca80/aws-listener.git"

  environment = var.environment
  ingress     = module.ingress
  name        = each.key
  port        = each.value
  tags        = var.tags
}
