resource "aws_s3_bucket" "three-tier-bucket" {
  bucket = "three-tier-architecture"
  

  tags = {
    Name        = "three-tier-architecture"
    Environment = "Dev"
  }
}