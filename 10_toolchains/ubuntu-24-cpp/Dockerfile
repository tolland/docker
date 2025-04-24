FROM tolland/ubuntu-24-builder:latest

ARG DEBIAN_FRONTEND="noninteractive"

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
        apt-get update && \
        apt-get install -y \
            autoconf \
            automake \
            build-essential \
            clang \
            cmake \
            dos2unix \
            g++ \
            gcc \
            gdb \
            libtool \
            locales-all \
            make \
            ninja-build \
            python3-dev \
            rsync \
            tar \
            tzdata \
            valgrind \
            wget

RUN apt-get clean

# ubuntu already has user ubuntu with uid 1000
# ARG CONTAINER_UID=1000
# RUN useradd -m -u ${CONTAINER_UID} -s /bin/bash builder
# USER builder
