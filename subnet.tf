# Public subnet 1
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.app_vpc.id
  cidr_block              = var.subnet_pub_cidr[0]
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1a"
  tags = {
    Name = "Public Subnet 1"
  }
}

# Public subnet 2
resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.app_vpc.id
  cidr_block              = var.subnet_pub_cidr[1]
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1b"
  tags = {
    Name = "Public Subnet 2"
  }
}

# Public subnet 3
resource "aws_subnet" "public_subnet_3" {
  vpc_id                  = aws_vpc.app_vpc.id
  cidr_block              = var.subnet_pub_cidr[2]
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1c"
  tags = {
    Name = "Public Subnet 3"
  }
}

# Private subnet 1
resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.app_vpc.id
  cidr_block              = var.subnet_pri_cidr[0]
  map_public_ip_on_launch = false
  availability_zone       = "eu-central-1a"
  tags = {
    Name = "Private Subnet 1"
  }
}

# Private subnet 2
resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.app_vpc.id
  cidr_block              = var.subnet_pri_cidr[1]
  map_public_ip_on_launch = false
  availability_zone       = "eu-central-1b"
  tags = {
    Name = "Private Subnet 2"
  }
}

# Private subnet 3
resource "aws_subnet" "private_subnet_3" {
  vpc_id                  = aws_vpc.app_vpc.id
  cidr_block              = var.subnet_pri_cidr[2]
  map_public_ip_on_launch = false
  availability_zone       = "eu-central-1c"
  tags = {
    Name = "Private Subnet 3"
  }
}