terraform {
  backend "s3" {
    key    = "terraform/ebs.tfstate"
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

resource "aws_ebs_volume" "this" {
  for_each = var.volumes

  availability_zone = each.value.availability_zone
  final_snapshot    = true
  size              = each.value.size
  type              = each.value.type

  tags = {
    Name    = each.key
    Purpose = "data"
  }
}
