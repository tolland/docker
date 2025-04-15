FROM ubuntu:24.04

ARG DEBIAN_FRONTEND="noninteractive" \
    TZ=Etc/UTC

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
        apt-get update && \
        apt-get install -y --no-install-recommends \
        python3-minimal \
        python3-pip \
        rsync \
        tar \
        wget

RUN apt-get clean
