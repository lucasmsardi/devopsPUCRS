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

resource "null_resource" "app_clone" {
  provisioner "local-exec" {
    command = <<EOT
      echo "Clonando o repositório para teste..."
      git clone ${var.repo_url} ./app
      echo "Simulando instalação de dependências e build..."
      cd ./app
      echo "npm install"
      echo "npm run build"
    EOT
  }
}
