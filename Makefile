docs: \
	docs-build \
	docs-serve

docs-build:
	docker build -t "docs:docs" ./docker/docs

docs-serve:
	docker run --rm -it \
		-p 9003:8000 \
		-v ${PWD}/docs/mkdocs.yaml:/docs/mkdocs.yml:delegated \
		-v ${PWD}/docs/mkdocs:/docs/docs:delegated \
		mkdocs:mkdocs mkdocs serve --dev-addr=0.0.0.0:8000
