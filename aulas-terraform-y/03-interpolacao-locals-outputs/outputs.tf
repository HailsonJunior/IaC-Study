output "bucket_name" {
  value = aws_s3_bucket.hjbucket.arn
  description = ""
}

output "bucket_domain_name" {
  value = aws_s3_bucket.hjbucket.bucket_domain_name
}

output "ips_file_path" {
    value = "${aws_s3_bucket.hjbucket}/${aws_s3_bucket_object.hjbucket.key}"
  
}