# external_lb_sg attached to Internet-facing LB allows Inbound From Your IP (or 0.0.0.0/0 for testing) on port 80 (HTTP)  
resource "aws_security_group" "external_lb_sg" {
  name        = "external-lb-sg"
  description = "Allow HTTP from the internet"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description = "Allow HTTP from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["24.228.191.161/32"]  # Replace with your IP, or ["0.0.0.0/0"] for testing
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "External-LB-SG"
  }
}




# web_instance_sg  Attached To  Web-tier EC2 instances Allows Inbound From external\_lb\_sg + your IP  on Port 80 (HTTP)
resource "aws_security_group" "web_instance_sg" {
  name        = "web-instance-sg"
  description = "Allow HTTP from External LB and your IP"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.external_lb_sg.id]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["24.228.191.161/32"]  # Again replace with your IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-Instance-SG"
  }
}



# internal_lb_sg Attached To Internal Load Balancer Allows Inbound From web\_instance\_sg on Port 80 (HTTP)
resource "aws_security_group" "internal_lb_sg" {
  name        = "internal-lb-sg"
  description = "Allow HTTP from web tier"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.web_instance_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Internal-LB-SG"
  }
}




# private_instance_sg Attached To App-tier EC2 instances Allows Inbound From internal\_lb\_sg + your IP on Port 4000 (TCP)
resource "aws_security_group" "private_instance_sg" {
  name        = "private-instance-sg"
  description = "Allow port 4000 from internal LB and your IP"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port       = 4000
    to_port         = 4000
    protocol        = "tcp"
    security_groups = [aws_security_group.internal_lb_sg.id]
  }

  ingress {
    from_port   = 4000
    to_port     = 4000
    protocol    = "tcp"
    cidr_blocks = ["24.228.191.161/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Private-App-Instance-SG"
  }
}




# db_instance_sg Attached To Database instances Allows Inbound From private\_instance\_sg on Port 3306 (MySQL)
resource "aws_security_group" "db_instance_sg" {
  name        = "db-instance-sg"
  description = "Allow MySQL access from app tier"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.private_instance_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DB-Instance-SG"
  }
}
