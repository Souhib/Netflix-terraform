resource "aws_security_group" "ingress_ssh_own_ip_security_group" {
  name        = "Allow ssh to custom ip"
  description = "Allow SSH inbound traffic to a custom ip address"
  vpc_id      = var.vpc_info.id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["86.218.66.163/32"]
  }

  tags = {
    Name = "sg-ingress-ssh-own-ip-security-group-${var.project_name}"
    project = var.project_name
    env = "prod"
    terraform = true
  }
}

resource "aws_security_group" "ingress_web_server_security_group" {
  name        = "Allow HTTP & HTTPS"
  description = "Allow HTTP & HTTPS inbound traffic to all IPs"
  vpc_id      = var.vpc_info.id


  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sg-ingress-web-server-security-group-${var.project_name}"
    project = var.project_name
    env = "prod"
    terraform = true
  }
}

resource "aws_security_group" "egress_web_server_security_group" {
  name        = "Allow all external IP"
  description = "Allow all external IPs to communicate with server"
  vpc_id      = var.vpc_info.id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sg-egress-web-server-security-group-${var.project_name}"
    project = var.project_name
    env = "prod"
    terraform = true
  }
}

resource "aws_subnet" "common_subnet" {
  vpc_id            = var.vpc_info.id
  cidr_block        = var.vpc_info.cidr_block

  tags = {
    Name = "subnet-${var.project_name}"
    project = var.project_name
    env = "prod"
    terraform = true
  }
}

resource "aws_network_interface" "common_web_server_network_interface" {
  subnet_id   = aws_subnet.common_subnet.id
  security_groups = [
    aws_security_group.ingress_ssh_own_ip_security_group.id,
    aws_security_group.ingress_web_server_security_group.id,
    aws_security_group.egress_web_server_security_group.id
  ]

  tags = {
    Name = "web-server-network-interface-${var.project_name}"
    project = var.project_name
    env = "prod"
    terraform = true
  }
}

output "common_web_server_network_interface" {
  value = {
    id = aws_network_interface.common_web_server_network_interface.id
  }
}