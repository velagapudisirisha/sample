provider "aws" {
 profile = "default"
 region = "ap-south-1"
}

resource "aws_instance" "myec2" {
  ami = "ami-022d03f649d12a49d" 
  instance_type = "t2.micro"
  subnet_id = "subnet-0a445389c2174ed0b"
  security_groups = ["sg-0058977174c866ce8"]
}
