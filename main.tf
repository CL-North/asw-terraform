provider "aws" {
  region       = var.aws_region
  access_key   = ""
  secret_key   = ""
}

resource "aws_s3_bucket" "my-s3-bucket" {
  bucket_prefix = var.bucket_prefix
  tags = var.s3tags
}
