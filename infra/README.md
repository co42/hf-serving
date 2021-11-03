# Infra

Infra deployed with [Terraform](https://www.terraform.io/) on [Kubernetes](https://kubernetes.io/).

## Usage

Create and fill terraform.tfvars (use `terraform.tfvars.template` as template).

```bash
terraform init
terraform apply
```

Get external IP

```bash
kubectl --namespace kourier-system get service kourier
```