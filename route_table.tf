resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.app_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.excercise_igw.id
  }

  tags = {
    Name = "All traffic to igw"
  }
}

resource "aws_route_table_association" "route_table_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route.id
}