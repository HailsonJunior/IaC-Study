resource "aws_instance" "web" {
    ami = "ami-09e67e426f25ce0d7"
    instance_type = "t2.micro"
    subnet_id = "subnet-3a5ad31b"
    vpc_security_group_ids = [ "${aws_security_group.allow_http.id}" ]

    tags = {
      "Name" = "HelloWorld"
    }
}

output "ip_address" {
    value = "${aws_instance.web.public_ip}"  
}