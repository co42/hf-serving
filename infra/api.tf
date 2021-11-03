resource "kubernetes_namespace" "api" {
  metadata {
    name = "api"
  }
}

resource "kubectl_manifest" "translate" {
  depends_on = [kubernetes_namespace.api]
  yaml_body = <<YAML
apiVersion: serving.knative.dev/v1
kind: Service
metadata:
  name: translate
  namespace: api
spec:
  template:
    metadata:
      annotations:
        autoscaling.knative.dev/class: "kpa.autoscaling.knative.dev"
        autoscaling.knative.dev/target: "4"
    spec:
      imagePullSecrets:
        - name: registry
      containers:
        - image: co422/hf:1.0
          ports:
            - containerPort: 8000
          env:
            - name: TARGET
              value: "Translate v1"
YAML
}