# Translate

This project aim to provide an API to translate text from English to French and everything needed to deploy it on Kubernetes.

## Project architecture

[API](./api/README.md)

[infrastructure](./infra/README.md)

[bench](./infra/README.md)

## Next steps

- Add DNS + HTTPS
- Add security group for Prometheus, Grafana, ...
- knative API service miss some configuration to handle scaling better, maximum number of instances for example.
- Logs should be collected. (With fluentd to an ElasticSearch cluster for example)
- Spawn Kubernetes and nodes with Terraform
- Add some tests