# Public subnet 1
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.app_vpc.id
  cidr_block              = var.subnet1_pub_cidr
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1a"
  tags = {
    Name = "Public Subnet 1"
  }
}

# Private subnet 1
resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.app_vpc.id
  cidr_block              = var.subnet1_pri_cidr
  map_public_ip_on_launch = false
  availability_zone       = "eu-central-1a"
  tags = {
    Name = "Private Subnet 1"
  }
}