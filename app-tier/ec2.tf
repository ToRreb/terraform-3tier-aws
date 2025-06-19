data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "app_instance" {
# For us-east-1: Amazon Linux 2 AMI (HVM), Kernel 5.10, SSD Volume Type
  ami                         = "ami-0c101f26f147fa7fd"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.private_app_subnet_az1.id
  vpc_security_group_ids      = [aws_security_group.private_instance_sg.id]
  associate_public_ip_address = false

  iam_instance_profile        = aws_iam_instance_profile.ec2_and_s3_role.name

  tags = {
    Name = "App-Instance"
  }

  # Optional: Add user_data to bootstrap your instance
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              # Additional bootstrap commands here
              EOF
}

resource "aws_iam_instance_profile" "ec2_and_s3_role" {
  name = "EC2andS3RoleProfile"
  role = aws_iam_role.ec2_and_s3_role.name
}
