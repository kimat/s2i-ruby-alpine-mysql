
IMAGE_NAME = kimat/s2i-ruby-alpine-mysql:`cat VERSION`

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .

.PHONY: test
test:
	docker build -t $(IMAGE_NAME)-candidate .
	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run

.PHONY: publish
publish:
	docker login
	docker push $(IMAGE_NAME)
