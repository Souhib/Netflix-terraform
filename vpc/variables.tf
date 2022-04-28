variable "cidr_block" {
  default = "192.168.0.0/24"
}

variable "vpc_name" {
  default = "netflix_vpc"
}

variable "project_name" {
  type    = string
  default = "my-netflix"
}