IMAGE		=	co422/hf
VERSION		=
PLATFORM	=	linux/amd64

.PHONY: cache
cache:
	python3 cache.py

.PHONY: build
build: cache
	docker build . -t "${IMAGE}:${VERSION}" --platform ${PLATFORM}

.PHONY: push
push: build
	docker push "${IMAGE}:${VERSION}"
