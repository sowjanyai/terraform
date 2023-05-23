provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA2EHXHW4VZEBXXNPP"
  secret_key = "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"
}

resource "aws_instance" "web" {
  ami           = "ami-0b08bfc6ff7069aff"
  instance_type = "t2.micro"
  


  tags = {
    Name = "sample"
  }
}

#securitygroup using Terraform

resource "aws_security_group" "tf_mysg" {
  name        = "security group using Terraform"
  description = "security group using Terraform"
  vpc_id      = "vpc-0eb2f34af4c0c4192"

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}