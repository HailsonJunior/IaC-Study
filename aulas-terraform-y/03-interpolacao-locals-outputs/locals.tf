locals {
    ip_filepath = "config/ips.json"
    common_tags = {
        Service = "Curso Terraform"
        ManagedBy = "Terraform"
        Environment = var.environment
        Owner = "Hailson Junior"
    }
}