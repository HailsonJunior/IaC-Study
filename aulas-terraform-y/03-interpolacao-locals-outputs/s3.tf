resource "aws_s3_bucket" "this" {
    bucket = "${randomPet.bucket.id}-${var.environment}"

    tags = {
        Service = "Curso Terraform"
        ManagedBy = "Terraform"
        Environment = var.environment
        Owner = "Hailson Junior"
    }
}