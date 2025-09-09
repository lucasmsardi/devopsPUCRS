terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = "sa-east-1"
}

resource "aws_security_group" "app_sg" {
  name        = "devops-project-3"
  description = "Allow access to app"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "app" {
  ami                    = "ami-02556f6726aa38019"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras install docker -y
    systemctl start docker

    docker pull lucasmsardi/devops:latest
    docker rm -f devops-container || true
    docker run -d --name devops-container -p 3000:3000 lucasmsardi/devops:latest
  EOF
}