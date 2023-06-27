resource "aws_instance" "demo1" {
  ami                       = ami-0fd92c7198991d562
  instance_type             = "t2.micro"
  vpc_security_group_ids    = [var.sg]

  tags     = {
    Name   = "EC2-Terraform"
  }

  provisioner "remote-exec" {
  
  # Connection Provisioner
  connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = self.public_ip
  }

    inline = [
      "ansible-pull -U https://github.com/b50-clouddevops/ansible.git -e COMPONENT=frontend -e ENV=dev -e APP_VERSION=0.0.2 roboshop-pull.yml",
    ]
  }

}

variable "sg" {}

output "public_ip" {
    value =  aws_instance.demo1.public_ip
}