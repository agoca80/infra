terraform {
  backend "s3" {
    key    = "terraform/vpc.tfstate"
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

module "vpc" {
  source = "git@github.com:agoca80/aws-vpc.git"

  azs                 = var.azs
  cidr                = var.cidr
  enable_nat_gateway  = var.enable_nat_gateway
  enable_vpn_gateway  = var.enable_vpn_gateway
  name                = var.name
  private_subnets     = var.private_subnets
  private_subnet_tags = var.private_subnet_tags
  public_subnets      = var.public_subnets
  public_subnet_tags  = var.public_subnets_tags
}

resource "aws_ssm_parameter" "vpc_id" {
  name  = format("/environment/%s/vpc_id", var.environment)
  type  = "String"
  value = module.vpc.vpc_id
}
