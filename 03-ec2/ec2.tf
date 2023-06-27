resource "aws_instance" "demo" {
  ami           = "ami-0fd92c7198991d562"
  instance_type = "t2.micro"

  tags = {
    Name = "Linux-Terraform"
  }
}