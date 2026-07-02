terraform {
  required_providers {
    helm = {
      version = "2.13.1"
    }
    kubernetes = {
      version = "2.29.0"
    }
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "~> 1.1"
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

provider "kubectl" {
  config_path = "~/.kube/config"
}

data "sops_file" "secrets" {
  source_file = "secrets.enc.yaml"
}
