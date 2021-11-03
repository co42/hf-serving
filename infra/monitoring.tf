resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

resource "helm_release" "prometheus-stack" {
  atomic     = true
  name       = "prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "19.2.2"
  namespace  = "monitoring"
  values = [
    templatefile("templates/values-kube-prometheus-stack.yml", {})
  ]
}
