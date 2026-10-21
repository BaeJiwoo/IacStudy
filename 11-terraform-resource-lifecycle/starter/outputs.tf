output "bucket_arn" {
  description = "ARN of the imported study bucket"
  value       = aws_s3_bucket.imported.arn
}
