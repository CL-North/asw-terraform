provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "my-s3-bucket" {
  bucket_prefix = var.bucket_prefix
  tags = var.s3tags
}

resource "aws_s3_bucket_versioning" "s3-versioning" {
  bucket = aws_s3_bucket.my-s3-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

/* We will define bucket policy here
resource "aws_s3_bucket_policy" "s3-policy" {
  bucket = aws_s3_bucket.my-s3-bucket.id
  policy = policy.json
}
*/
