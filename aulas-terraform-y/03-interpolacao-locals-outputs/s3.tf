resource "aws_s3_bucket" "hj-bucket" {
    bucket = "${random_pet.bucket.id}-${var.environment}"

    tags = local.common_tags
}

resource "aws_s3_bucket_object" "hj-bucket" {
    bucket = aws_s3_bucket.hj-bucket.bucket
    key = "config/${local.ip_filepath}"
    source = local.ip_filepath
    etag = filemd5(local.ip_filepath)
    }