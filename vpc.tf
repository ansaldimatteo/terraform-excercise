resource "aws_vpc" "app_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = "Excercise VPC"
  }
}