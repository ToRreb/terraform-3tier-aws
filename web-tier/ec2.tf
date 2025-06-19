resource "aws_instance" "web" {
  ami                    = "ami-xxxxxxxx"
  instance_type          = "t2.micro"
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  # other config: subnet_id, key_name, tags, etc.
}
