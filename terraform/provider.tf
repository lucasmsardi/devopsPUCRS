terraform {
  required_version = ">= 1.5.0"
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

provider "null" {}

variable "repo_url" {
  type        = string
  default     = "https://github.com/lucasmsardi/devopsPUCRS.git"
}

resource "null_resource" "app_clone" {
  provisioner "local-exec" {
    command = <<EOT
      echo "Clonando o repositório para teste..."
      git clone ${var.repo_url} ./app
      echo "Instalando dependências e build (simulado)..."
      cd ./app
      echo "npm install"
      echo "npm run build"
    EOT
  }
}
