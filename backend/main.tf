terraform {
  backend "s3" {
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

resource "aws_dynamodb_table" "this" {
  billing_mode   = "PROVISIONED"
  hash_key       = "LockID"
  name           = var.name
  read_capacity  = 1
  write_capacity = 1


  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket" "this" {
  bucket = var.name
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}
