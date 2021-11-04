# Translate API

API to translate text from English to French with [transformers](https://huggingface.co/transformers/).
The default model for this pipeline is used (t5-base).
Using [Sanic](https://sanicframework.org/en/guide/) webserver.

## Usage

```bash
python3 api.py
curl -XPOST localhost:8000/predict -d'["Translate this sentence", "And another one"]'
```

## Release new version

```bash
make push VERSION=1.0 # Depends on build and cache
```