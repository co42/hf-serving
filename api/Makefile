IMAGE		=	co422/hf
VERSION		=
PLATFORM	=	linux/amd64

.PHONY: build
build:
	docker build . -t "${IMAGE}:${VERSION}" --platform ${PLATFORM}

.PHONY: push
push: build
	docker push "${IMAGE}:${VERSION}"
