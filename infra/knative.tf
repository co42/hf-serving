// Based on https://knative.dev/docs/install/serving/install-serving-with-yaml/

data "kubectl_file_documents" "knative_serving_crds" {
  content = templatefile("${path.module}/templates/knative-serving-crds.yaml", {})
}

data "kubectl_file_documents" "knative_serving_core" {
  content = templatefile("${path.module}/templates/knative-serving-core.yaml", {
    ingress_class = "kourier.ingress.networking.knative.dev"
  })
}

data "kubectl_file_documents" "knative_serving_servicemonitor" {
  content = templatefile("${path.module}/templates/knative-serving-servicemonitor.yaml", {})
}

data "kubectl_file_documents" "kourier" {
  content = templatefile("${path.module}/templates/kourier.yaml", {})
}

data "kubectl_file_documents" "knative_serving_dashboards" {
  content = templatefile("${path.module}/templates/knative-serving-dashboards.yaml", {})
}

resource "kubectl_manifest" "knative_serving_crds" {
  count = length(data.kubectl_file_documents.knative_serving_crds.documents)
  yaml_body = element(data.kubectl_file_documents.knative_serving_crds.documents, count.index)
}

resource "kubectl_manifest" "knative_serving_core" {
  depends_on = [kubectl_manifest.knative_serving_crds]
  count      = length(data.kubectl_file_documents.knative_serving_core.documents)
  yaml_body  = element(data.kubectl_file_documents.knative_serving_core.documents, count.index)
}

resource "kubectl_manifest" "knative_serving_servicemonitor" {
  depends_on = [kubectl_manifest.knative_serving_core]
  count      = length(data.kubectl_file_documents.knative_serving_servicemonitor.documents)
  yaml_body  = element(data.kubectl_file_documents.knative_serving_servicemonitor.documents, count.index)
}

resource "kubectl_manifest" "kourier" {
  depends_on = [kubectl_manifest.knative_serving_servicemonitor]
  count      = length(data.kubectl_file_documents.kourier.documents)
  yaml_body  = element(data.kubectl_file_documents.kourier.documents, count.index)
}

resource "kubectl_manifest" "knative_serving_dashboards" {
  depends_on = [kubectl_manifest.kourier]
  count      = length(data.kubectl_file_documents.knative_serving_dashboards.documents)
  yaml_body  = element(data.kubectl_file_documents.knative_serving_dashboards.documents, count.index)
}
