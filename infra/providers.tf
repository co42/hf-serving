variable "kube_config" {
  type = string
}

terraform {
  required_providers {
    helm    = {
      source  = "hashicorp/helm"
      version = "2.1.2"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.10.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = var.kube_config
  }
}

provider "kubernetes" {
  config_path = var.kube_config
}

provider "kubectl" {
  config_path = var.kube_config
}