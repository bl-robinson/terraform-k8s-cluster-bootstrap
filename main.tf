terraform {
  required_providers {
    helm = {
      version = "2.13.1"
    }
    kubernetes = {
      version = "2.29.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}
