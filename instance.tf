provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "test" {
    availability_zone = "us-east-1a"
    ami = "ami-13be557e"
    instance_type = "t2.micro"
}