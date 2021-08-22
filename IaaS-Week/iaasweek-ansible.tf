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

resource "aws_instance" "IaC-Host1" {
    ami = "ami-019212a8baeffb0fa"
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.my_key.key_name}"
    security_groups = ["${aws_security_group.allow_iac_ssh.name}"]
    tags = {
      Name = "IaC-Host1"
    }
}

resource "aws_instance" "IaC-Host2" {
    ami = "ami-019212a8baeffb0fa"
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.my_key.key_name}"
    security_groups = ["${aws_security_group.allow_iac_ssh.name}"]
    tags = {
      Name = "IaC-Host2"
    }
}

resource "aws_key_pair" "my_key" {
    key_name = "my_key"
    public_key = "${file("/home/hailson.junior/.ssh/id_rsa.pub")}"
}

resource "aws_security_group" "allow_iac_ssh" {
    name = "allow_iac_ssh"
    ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["172.31.93.181/32"]
    }
    egress {
      from_port = 0
      to_port = 0
      protocol = -1
      cidr_blocks = ["0.0.0.0/0"]
    }
}

output "public_dns_host1" {
  value = "${aws_instance.IaC-Host1.public_dns}"
}

output "public_dns_host2" {
  value = "${aws_instance.IaC-Host2.public_dns}"
}
