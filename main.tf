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
  
/* S3 Bucket Permissions [Terraform state is written to the key path/to/my/key]

terraform {
  backend "s3" {
    bucket = "my-s3-bucket"
    key    = "path/to/my/key"
    region = var.aws_region
  }
}

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::my-s3-bucket"
    },
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"],
      "Resource": "arn:aws:s3:::my-s3-bucket/path/to/my/key"
    }
  ]
}

