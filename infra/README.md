# Infra

Infra deployed with [Terraform](https://www.terraform.io/) on [Kubernetes](https://kubernetes.io/).

[knative](https://knative.dev/docs/) is used to handle auto-scaling and monitoring of the API.

## Usage

Create and fill terraform.tfvars (use `terraform.tfvars.template` as template), a kubeconfig is needed.

```bash
terraform init
terraform apply
```

Get external IP

```bash
kubectl --namespace kourier-system get service kourier
```