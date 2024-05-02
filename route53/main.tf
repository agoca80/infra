terraform {
  backend "s3" {
    key    = "terraform/route53.tfstate"
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

resource "aws_route53_zone" "this" {
  name = var.zone_name
  tags = {
    Public = "true"
  }
}

resource "aws_ssm_parameter" "zone_id" {
  name  = format("/environment/%s/route53/zone_id", var.environment)
  type  = "String"
  value = aws_route53_zone.this.zone_id
}

resource "aws_ssm_parameter" "zone_name" {
  name  = format("/environment/%s/route53/zone_name", var.environment)
  type  = "String"
  value = aws_route53_zone.this.name
}
