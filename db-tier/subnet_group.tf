# DB subnet group (referencing your two private DB subnets)
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "my-db-subnet-group"
  description = "Subnet group for DB layer in my VPC"
  subnet_ids = [
    aws_subnet.private_db_subnet_az1.id,
    aws_subnet.private_db_subnet_az2.id,
  ]

  tags = {
    Name = "My-DB-Subnet-Group"
  }
}
