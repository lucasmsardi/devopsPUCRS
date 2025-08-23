variable "aws_region" {
  description = "Região AWS"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Tipo de instância EC2"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Chave SSH para acessar a instância"
  type        = string
}

variable "ami" {
  description = "AMI Ubuntu 22.04"
  default     = "ami-0c02fb55956c7d316"
}
