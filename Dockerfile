#
# MIT License
#
# https://github.com/lentiancn/dockerhub-gentkit-alpine/blob/main/LICENSE
#

# If it is "unknown", cause the 'alpine' base image to fail the build to ensure the correct version is referenced.
ARG IMAGE_VERSION="unknown"

# Use 'alpine' as the base image with specified version
FROM alpine:${IMAGE_VERSION}

# Define build arguments for image metadata
ARG IMAGE_VERSION="unknown"
ARG IMAGE_BUILD_DATE="unknown"

# Image metadata labels following OCI Image Format Specification
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
    # Extract Alpine Version from os-release and set welcome message
    ALPINE_VERSION=$(grep VERSION_ID /etc/os-release | cut -d'=' -f2) && \
    echo -e "\
Welcome to Alpine Linux on Docker!\n\
Alpine Version: ${ALPINE_VERSION}" > /etc/motd && \
    # Update package index without caching
    apk update --no-cache && \
    # Upgrade all installed packages to latest versions without caching
    apk upgrade --no-cache && \
    # Clean up cache files and unnecessary documentation to reduce image size
    rm -rf /var/cache/apk/* \
        /tmp/* \
        /var/tmp/* \
        /root/.cache \
        /usr/share/man \
        /usr/share/doc \
        /usr/share/info

# Set the working directory to /root for subsequent instructions
WORKDIR /root
