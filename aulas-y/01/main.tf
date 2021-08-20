provider "aws" {
    region = "us-east-1"
    shared_credentials_file = "/home/hailson.junior/.aws/credentials"
    profile = "Terraform"
}

resource "aws_s3_bucket" "my-tf-test-bucket" {
    bucket = "my-tf-test-bucket-hjunior"
    acl = "private"
    tags = {
        Name = "My bucket"
        Environment = "Dev"
        Managedby = "Terraform"
    }
}