variable "registry_server" {
  type = string
}

variable "registry_username" {
  type = string
}

variable "registry_password" {
  type = string
}

resource "kubernetes_secret" "registry" {
  metadata {
    name = "registry"
    namespace = kubernetes_namespace.api.metadata[0].name
  }

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        (var.registry_server) = {
          auth = base64encode("${var.registry_username}:${var.registry_password}")
        }
      }
    })
  }

  type = "kubernetes.io/dockerconfigjson"
}
