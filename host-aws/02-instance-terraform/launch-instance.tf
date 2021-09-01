terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
    shared_credentials_file = "./.aws/credentials"
    profile = "hjunior"
}

resource "aws_instance" "aws-host" {
    ami = "ami-0c59e532e98c72c0d"  
    instance_type = "t2.micro"
    key_name = "iac-new.pem"
    security_groups = [ "iac-group" ]
    tags = {
      "Name" = "aws-study"
    }
}

output "aws_public_dns" {
  value = "${aws_instance.aws-host.public_dns}"
}