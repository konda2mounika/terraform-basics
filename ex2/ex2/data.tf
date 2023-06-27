data "aws_ami" "my_ami" {
  most_recent      = true
  name_regex       = "b50-bash-with-ansible"
  owners           = ["self"]
}

 