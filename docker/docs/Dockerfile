FROM python:3.11-alpine

RUN apk add curl make util-linux

RUN python -m ensurepip --upgrade

RUN pip install pymdown-extensions
RUN pip install pygments
RUN pip install mkdocs
RUN pip install mkdocs-include-markdown-plugin
RUN pip install mkdocs-drawio-file
RUN pip install mkdocs-material

RUN mkdocs new docs

EXPOSE 8000

WORKDIR /docs
