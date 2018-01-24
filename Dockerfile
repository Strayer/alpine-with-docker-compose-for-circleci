FROM alpine:3.7

ARG DOCKER_VERSION="17.03.0-ce"

# git & ssh for CircleCI "checkout" step
RUN apk add --no-cache --no-progress git openssh-client

RUN apk add --no-cache curl && \
    curl -L -o /tmp/docker.tgz \
    https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz && \
    tar -xz -C /tmp -f /tmp/docker.tgz && \
    mv /tmp/docker/docker /usr/local/bin/ && \
    rm -r /tmp/docker* && \
    apk del curl

RUN apk add --no-cache python3 && \
    pip3 install --no-cache-dir docker-compose
