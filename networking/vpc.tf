resource "aws_vpc" "three_tier_vpc" {
  cidr_block           = "10.0.0.0/16"  # allows up to 65,536 IPs
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "ThreeTier-VPC"
  }
}

