ARG DOCKER_TAG
FROM ruby:${DOCKER_TAG}

RUN apk add libffi-dev
