resource "aws_internet_gateway" "excercise_igw" {
  vpc_id = aws_vpc.app_vpc.id
}