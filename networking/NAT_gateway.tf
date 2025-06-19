resource "aws_eip" "nat_eip_az1" {
  domain = "vpc"

  tags = {
    Name = "NAT-EIP-AZ1"
  }
}

resource "aws_eip" "nat_eip_az2" {
  domain = "vpc"

  tags = {
    Name = "NAT-EIP-AZ2"
  }
}


resource "aws_nat_gateway" "nat_az1" {
  allocation_id = aws_eip.nat_eip_az1.id
  subnet_id     = aws_subnet.public_web_subnet_az1.id

  tags = {
    Name = "NAT-Gateway-AZ1"
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "nat_az2" {
  allocation_id = aws_eip.nat_eip_az2.id
  subnet_id     = aws_subnet.public_web_subnet_az2.id

  tags = {
    Name = "NAT-Gateway-AZ2"
  }

  depends_on = [aws_internet_gateway.igw]
}
