variable "aws_region" {
  type        = string
  description = "Região do privider AWS"
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "Ambiente bucket"
  default     = "Dev"
}

variable "aws_profile" {
  type        = string
  description = "AWS profile"
  default     = "Terraform"
}

variable "aws_credential" {
  type        = string
  description = "AWS Credital"
  default     = "/home/hailson.junior/.aws/credentials"
}
