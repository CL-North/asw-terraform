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

