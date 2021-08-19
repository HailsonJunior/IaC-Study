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

resource "aws_instance" "IaC-Server" {
    ami = "ami-019212a8baeffb0fa"
    instance_type = "t2.micro"
    key_name = "IaC"
    security_groups = ["${aws_security_group.IaC_group.name}"]
    tags = {
      Name = "IaC Server"
    }
}

resource "aws_instance" "host1" {
    ami = "ami-019212a8baeffb0fa"
    instance_type = "t2.micro"
    key_name = "IaC"
    security_groups = ["${aws_security_group.IaC_group.name}"]
    tags = {
      Name = "host1"
    }
}

resource "aws_instance" "host2" {
    ami = "ami-019212a8baeffb0fa"
    instance_type = "t2.micro"
    key_name = "IaC"
    security_groups = ["${aws_security_group.IaC_group.name}"]
    tags = {
      Name = "host2"
    }
}

resource "aws_security_group" "IaC_group" {
    name = "Iac_group"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["187.45.60.85/32"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output "public_dns" {
  value = "${aws_instance.IaC-Server.public_dns}"
}