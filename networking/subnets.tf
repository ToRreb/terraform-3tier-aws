data "aws_availability_zones" "available" {}

# AZ A
resource "aws_subnet" "public_web_subnet_az1" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "Public-Web-Subnet-AZ-1"
  }
}

resource "aws_subnet" "private_app_subnet_az1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "Private-App-Subnet-AZ-1"
  }
}

resource "aws_subnet" "private_db_subnet_az1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "Private-DB-Subnet-AZ-1"
  }
}

# AZ B
resource "aws_subnet" "public_web_subnet_az2" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "Public-Web-Subnet-AZ-2"
  }
}

resource "aws_subnet" "private_app_subnet_az2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "Private-App-Subnet-AZ-2"
  }
}

resource "aws_subnet" "private_db_subnet_az2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "Private-DB-Subnet-AZ-2"
  }
}
