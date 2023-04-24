provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2_ubuntu" {
    ami = "ami-007855ac798b5175e"
    instance_type = "t2.micro"
    key_name = "ssh_connect"
    tags = {
    Name = "AWS Server"
    Owner = "Denis Uglov"
    Project = "Terraform"
    }
}

data "template_file" "inventory" {
  template = file("./_template/inventory.tpl")
  
  vars = {
    host = join("", ["ansible_host: ", aws_instance.ec2_ubuntu.public_ip])
  }
}

resource "local_file" "save_inventory" {
  content  = data.template_file.inventory.rendered
  filename = "./ansible/inventory.yml"
}



