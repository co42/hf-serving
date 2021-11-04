import transformers


if __name__ == '__main__':
    transformers.pipeline('translation_en_to_fr', model_kwargs={'cache_dir': './cache'})
