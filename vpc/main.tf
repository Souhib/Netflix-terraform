resource "aws_vpc" "common_vpc" {
  cidr_block  = var.cidr_block

  tags = {
    Name = var.vpc_name
    project = var.project_name
    env = "prod"
    terraform = true
  }
}


#output "common_vpc" {
#  value = {
#    Name = aws_vpc.common_vpc.tags.Name
#    cidr_block = aws_vpc.common_vpc.tags.Name
#    id = aws_vpc.common_vpc.id
#  }
#}

output "common_vpc" {
  value = {
    name = aws_vpc.common_vpc.tags.Name
    cidr_block = aws_vpc.common_vpc.cidr_block
    id = aws_vpc.common_vpc.id
  }
}
