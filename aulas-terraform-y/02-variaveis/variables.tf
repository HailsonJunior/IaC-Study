variable "aws_region" {
    type = string
    description = "Região do privider AWS"
}

variable "aws_profile" {
    type = string
    description = "AWS profile"
}

variable "aws_credential" {
    type = string
    description = "AWS Credital"
}

variable "instance_tags" {
    type = map(string)
    description = ""
    default = {
        Name = "Ubuntu"
        Project = "Curso AWS com Terraform"
    }
}