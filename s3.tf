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

/* S3 Bucket policy 
resource "aws_s3_bucket_policy" "s3-policy" {
  bucket = aws_s3_bucket.my-s3-bucket.id
  policy = policy.json
}
*/
  
output "s3_bucket_name" {
  value = aws_s3_bucket.my-s3-bucket.id
}

output "s3_bucket_region" {
  value = aws_s3_bucket.my-s3-bucket.region
}

output "s3_bucket_domain_name" {
  value = aws_s3_bucket.my-s3-bucket.bucket_domain_name
}

output "s3_bucket_zone_id" {
  value = aws_s3_bucket.my-s3-bucket.hosted_zone_id 
}

