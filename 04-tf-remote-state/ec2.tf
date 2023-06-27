provider "aws" {
        region = "us-east-1"
}

resource "aws_instance" "demo1" {
  ami           = "ami-0fd92c7198991d562"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allows_ssh.id]

  tags = {
    Name = "EC2-Terraform"
  }
}

output "public_ip"{
        value = aws_instance.demo1.public_ip
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