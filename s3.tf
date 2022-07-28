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

resource "aws_ami" "" {
  name = ""
}
/* S3 Bucket policy 
resource "aws_s3_bucket_policy" "s3-policy" {
  bucket = aws_s3_bucket.my-s3-bucket.id
  policy = policy.json
}
*/
  
/* S3 Bucket ACL
resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = aws_s3_bucket.my-s3-bucket.id
  acl    = "private"
}
*/
  
/* S3 Public access 
resource "aws_s3_bucket_public_access_block" "s3-public" {
  bucket = aws_s3_bucket.my-s3-bucket.id
  block_public_acls   = true
  block_public_policy = true
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

// output

