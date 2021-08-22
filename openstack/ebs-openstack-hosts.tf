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

resource "aws_volume_attachment" "ebs_att" {
    device_name = "/dev/sda"
    volume_id = "aws_ebs_volume.volume_controller.id"
    instance_id = ""
}

resource "aws_ebs_volume" "volume_controller" {
    availability_zone = "us-east-1b"
    size = 30
}

