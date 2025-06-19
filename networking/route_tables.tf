# This route table connects the public subnets to the Internet Gateway.
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public-Route-Table"
  }
}

# Associate Public Subnet AZ1
resource "aws_route_table_association" "public_web_assoc_az1" {
  subnet_id      = aws_subnet.public_web_subnet_az1.id
  route_table_id = aws_route_table.public_rt.id
}

# Associate Public Subnet AZ2
resource "aws_route_table_association" "public_web_assoc_az2" {
  subnet_id      = aws_subnet.public_web_subnet_az2.id
  route_table_id = aws_route_table.public_rt.id
}



# Each private subnet will need its own route table to direct outbound traffic through its respective NAT Gateway.
resource "aws_route_table" "private_app_rt_az1" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_az1.id
  }

  tags = {
    Name = "Private-App-RT-AZ1"
  }
}

resource "aws_route_table_association" "private_app_assoc_az1" {
  subnet_id      = aws_subnet.private_app_subnet_az1.id
  route_table_id = aws_route_table.private_app_rt_az1.id
}

# Each private subnet will need its own route table to direct outbound traffic through its respective NAT Gateway.
resource "aws_route_table" "private_app_rt_az2" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_az2.id
  }

  tags = {
    Name = "Private-App-RT-AZ2"
  }
}

resource "aws_route_table_association" "private_app_assoc_az2" {
  subnet_id      = aws_subnet.private_app_subnet_az2.id
  route_table_id = aws_route_table.private_app_rt_az2.id
}
