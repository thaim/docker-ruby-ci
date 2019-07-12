ARG DOCKER_TAG
FROM ruby:${DOCKER_TAG}

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    libffi-dev \
    libsqlite3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
