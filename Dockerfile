FROM alpine:latest

ARG IMAGE_VERSION
ARG IMAGE_BUILD_DATE

LABEL maintainer="Len <lentiancn@126.com>" \
      description="A Docker image based on the 'alpine' base image." \
      org.opencontainers.image.title="Alpine Linux on Docker" \
      org.opencontainers.image.description="A Docker image based on the 'alpine' base image." \
      org.opencontainers.image.version="${IMAGE_VERSION}" \
      org.opencontainers.image.created="${IMAGE_BUILD_DATE}" \
      org.opencontainers.image.source="https://github.com/lentiancn/dockerhub-gentkit-alpine" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.vendor="GentKit"

RUN set -eu && \
    ALPINE_VERSION=$(grep VERSION_ID /etc/os-release | cut -d'=' -f2) && \
    echo -e "\
Welcome to Alpine Linux on Docker!\n\
Version: ${IMAGE_VERSION}\n\
Alpine Version: ${ALPINE_VERSION}" > /etc/motd && \
    apk update --no-cache && \
    apk upgrade --no-cache && \
    rm -rf /var/cache/apk/* \
        /tmp/* \
        /var/tmp/* \
        /root/.cache \
        /usr/share/man \
        /usr/share/doc \
        /usr/share/info

WORKDIR /root
