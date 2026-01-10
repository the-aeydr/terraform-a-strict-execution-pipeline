output "bucket" {
  description = "The name of the bucket."
  value       = var.bucket
}

output "bucket_id" {
  description = "The name of the bucket."
  value       = aws_s3_bucket.artifacts.id
}

output "bucket_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = aws_s3_bucket.artifacts.arn
}

output "bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = aws_s3_bucket.artifacts.bucket_domain_name
}

