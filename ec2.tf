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

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.myvpc.id}" 
  tags = {
    Name = "15june_igw"
  }
}

resource "aws_route_table" "prt" {
  vpc_id = "${aws_vpc.myvpc.id}" 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${ aws_internet_gateway.igw.id }"
  }
}

resource "aws_subnet" "subnet1" {
   tags = {
      Name = "Terra-subnet1"
   }
   cidr_block = "172.34.0.0/25"
   vpc_id = "${aws_vpc.myvpc.id}"
   map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet2" {
   tags = {
       Name = "Terraform-subnet2"
   }
   cidr_block = "172.34.0.128/25"
   vpc_id = "${aws_vpc.myvpc.id}"
   map_public_ip_on_launch = true
}

resource "aws_route_table_association" "psrta" {
   subnet_id = "${ aws_subnet.subnet1.id }"
   route_table_id = "${ aws_route_table.prt.id }"
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
