terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.27"
        }
    }

    required_version = ">= 0.14.9"
}

provider "aws" {
    region = "us-east-1"
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
