# Created with guidance from https://www.bogotobogo.com/DevOps/Terraform/Terraform-VPC-Subnet-ELB-RouteTable-SecurityGroup-Apache-Server-1.php

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_servers" {
  count           = "${length(var.subnets_cidr)}"
  ami             = "ami-04763b3055de4860b"
  instance_type   = "t2.nano"
  security_groups = ["${aws_security_group.app_servers.id}"]
  subnet_id       = "${element(aws_subnet.public.*.id, count.index)}"

  user_data = <<-EOF
        #! /bin/bash
        cd /opt
        git clone https://github.com/matthewdockerty/cosc349-assignment2-deployment
        cd cosc349-assignment2-deployment
        chmod +x test
        mv app.service /lib/systemd/system/app.service

        echo -e "Environment=SERVER_NAME=${count.index}" >> /lib/systemd/system/app.service
        systemctl start app
        systemctl enable app
        systemctl status app
        EOF

  tags = {
    Name = "cosc349_app_${count.index}"
  }
}
