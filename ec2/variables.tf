variable "project_name" {
  type    = string
  default = "my-netflix"
}

variable "instance_type" {
  default = "t2.nano"
}

variable "aws_region" {
  default = "eu-west-1"
}

variable "ec2_instance_name" {
  default = "netflix_ec2"
}

variable "network_interface_info" {
  type = object({
    id = string
  })
}
