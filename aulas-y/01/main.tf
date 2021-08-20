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
        Owner = "Hailson Junior"
        UpdatedAt = "2021-08-20"
    }
}
