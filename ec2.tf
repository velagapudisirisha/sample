provider "aws" {
 profile = "default"
 region = "us-east-1"
}

resource "aws_vpc" "myvpc" {
   tags = {
     Name = "terra-vpc"
   }
   cidr_block = "172.34.0.0/24"
}

resource "aws_subnet" "subnet1" {
   tags = {
      Name = "Terra-subnet1"
   }
   cidr_block = "172.34.0.0/25"
   vpc_id = "${aws_vpc.myvpc.id}"
}

resource "aws_subnet" "subnet2" {
   tags = {
       Name = "Terraform-subnet2"
   }
   cidr_block = "172.34.0.128/25"
   vpc_id = "${aws_vpc.myvpc.id}"
}

resource "aws_security_group" "mysg" {
   vpc_id = "${aws_vpc.myvpc.id}"
   tags = {
     Name = "Terra-SG"
   }
   ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

   }
   egress {
    protocol = "tcp"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
   }
}
