ARG IMAGE_VERSION
FROM golang:$IMAGE_VERSION

RUN apt-get update \
    && apt-get install -y python-is-python3 python3-pip gettext-base mysql\* vim netcat \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install requests

ARG MIGRATE_VERSION=v4.15.2
RUN curl -L https://github.com/golang-migrate/migrate/releases/download/$MIGRATE_VERSION/migrate.linux-amd64.tar.gz | tar xvz \
    && chmod +x ./migrate && mv ./migrate /usr/local/bin/migrate
