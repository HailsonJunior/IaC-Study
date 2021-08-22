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

resource "aws_instance" "controller" {
    ami = "ami-0cb5f8e033cfa84d2"
    instance_type = "t2.large"
    key_name = "${aws_key_pair.key_openstack.key_name}"
    security_groups = []
    tags = {
        Name = "Controller Node"
    }
}

resource "aws_key_pair" "key_openstack" {
    key_name = "my_key"
    public_key = "${file("/home/hailson.junior/.ssh/id_rsa.pub")}"
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
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

resource "aws_ebs_volume" "volume_controller" {
    availability_zone = "us-west-2a"
    size = 30
}

resource "aws_volume_attachment" "ebs_att_controller" {
    device_name = "/dev/sda"
    volume_id = "aws_ebs_controller.ad5e1b42-a999-4d1c-90a7-59ff7858d973"
    instance_id = "ad5e1b42-a999-4d1c-90a7-59ff7858d973"
}

output "public_dns_controller" {
    value = "${aws_instance.controller.public_dns}"
}