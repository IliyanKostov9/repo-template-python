FROM python:3.11.9-alpine
WORKDIR /app
COPY requirements.txt /app

RUN pip install -r requirements.txt
RUN apk update \
	&& apk add --no-cache build-base cmake

VOLUME /tmp
COPY . /app

LABEL org.opencontainers.image.source=https://github.com/IliyanKostov9/repo-template-python \
	version="0.0.1.RELEASE" \
	description="Sample docker image for python"

ENTRYPOINT [ "make","run" ]
