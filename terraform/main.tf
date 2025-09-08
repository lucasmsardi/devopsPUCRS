
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

resource "aws_instance" "app" {
  ami           = "ami-02556f6726aa38019" 
  instance_type = "t2.micro"

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras install docker -y
    service docker start
    usermod -a -G docker ec2-user
    docker run -d -p 3000:3000 sha256:fdcb498fd5d64c2390168935a78d9f1442496ead5e7b2c02d0d7537d8e9ae02f
  EOF

}
