FROM ubuntu:20.04

ARG DEBIAN_FRONTEND="noninteractive" \
    TZ=Etc/UTC

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
      apt-get update \
      && apt-get install -y --no-install-recommends \
        rsync \
        tar \
        python \
        python-pip \
        wget

RUN apt-get clean
