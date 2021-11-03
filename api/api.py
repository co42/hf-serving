from sanic import Sanic
from sanic.response import json, text
import transformers

app = Sanic('Translate')


@app.get('/health')
async def health(request):
    return text('')


@app.post('/predict')
async def predict(request):
    inputs = request.json
    outputs = app.ctx.pipeline(inputs)
    return json(outputs)


if __name__ == '__main__':
    app.ctx.pipeline = transformers.pipeline('translation_en_to_fr', model_kwargs={'cache_dir': './cache'})
    app.run(host='0.0.0.0', port=8000)
