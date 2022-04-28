data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # AWS User account of Ubuntu
}

resource "aws_instance" "netflix_ec2" {
  ami           = data.aws_ami.ubuntu.id # eu-west-1
  instance_type = var.instance_type

  tags = {
    Name = var.ec2_instance_name
  }

  network_interface {
    device_index         = 0
    network_interface_id = var.network_interface_info.id
  }
}
