FROM alpine:latest AS final

ARG IMAGE_VERSION=1.0.0

LABEL maintainer="Len <lentiancn@126.com>" \
      description="A Docker image based on the 'alpine' base image." \
      org.opencontainers.image.title="Alpine Linux on Docker" \
      org.opencontainers.image.description="A Docker image based on the 'alpine' base image." \
      org.opencontainers.image.version="${IMAGE_VERSION}" \
      org.opencontainers.image.source="https://github.com/lentiancn/dockerhub-gentkit-alpine" \
      org.opencontainers.image.licenses="MIT"

RUN set -eux && \
    apk update --no-cache && \
    apk upgrade --no-cache && \
    apk del --no-cache pax-utils libcap libcap-utils libiconv 2>/dev/null || true && \
    rm -rf /var/cache/apk/* /tmp/* /var/tmp/* /root/.cache && \
    history -c

WORKDIR /root
