#
# MIT License
#
# https://github.com/lentiancn/dockerhub-gentkit-alpine/blob/main/LICENSE
#

# If it is "unknown", cause the 'alpine' base image to fail the build to ensure the correct version is referenced.
ARG IMAGE_VERSION="unknown"

FROM alpine:${IMAGE_VERSION}

ARG IMAGE_VERSION="unknown"
ARG IMAGE_BUILD_DATE="unknown"

LABEL maintainer="Len <lentiancn@126.com>" \
      description="A Docker image based on the 'alpine' base image." \
      org.opencontainers.image.title="Alpine Linux on Docker" \
      org.opencontainers.image.description="A Docker image based on the 'alpine' base image." \
      org.opencontainers.image.vendor="GentKit" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.source="https://github.com/lentiancn/dockerhub-gentkit-alpine" \
      org.opencontainers.image.version="${IMAGE_VERSION}" \
      org.opencontainers.image.created="${IMAGE_BUILD_DATE}"

RUN set -eu && \
    ALPINE_VERSION=$(grep VERSION_ID /etc/os-release | cut -d'=' -f2) && \
    echo -e "\
Welcome to Alpine Linux on Docker!\n\
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
