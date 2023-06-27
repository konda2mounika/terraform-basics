provider "aws" {
        region = "us-east-1"
}

resource "aws_instance" "demo" {
  ami           = "ami-0fd92c7198991d562"
  instance_type = "t2.micro"

  tags = {
    Name = "EC2-Terraform-instance"
  }
}

output "public_ip"{
        value = aws_instance.demo.public_ip
}
# Creates Security group

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSh inbound traffic"

  ingress {
    description      = "SSH  from ITERNET"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssg_sg"
  }
}