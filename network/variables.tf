variable "project_name" {
  type    = string
  default = "my-netflix"
}

variable "aws_region" {
  default = "eu-west-1"
}

variable "vpc_info" {
  type = object({
    name = string
    cidr_block = string
    id = string
  })
}
