from sanic import Sanic
from sanic.response import json
import transformers
import asyncio

app = Sanic('Translate')


# Input body: ["Some sentences to translate", "another one"]
# Output body: [{"translation_text":"Quelques phrases à traduire"},{"translation_text":"une autre"}]
@app.post('/predict')
async def predict(request):
    inputs = request.json
    loop = asyncio.get_running_loop()
    # Run in pipeline in an executor to not block the running loop
    outputs = await loop.run_in_executor(None, lambda: app.ctx.pipeline(inputs))
    return json(outputs)


if __name__ == '__main__':
    app.ctx.pipeline = transformers.pipeline('translation_en_to_fr', model_kwargs={'cache_dir': './cache'})
    app.run(host='0.0.0.0', port=8000)