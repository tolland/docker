
FROM tolland/ubuntu-20-builder:latest

ARG DEBIAN_FRONTEND="noninteractive" \
    TZ=Etc/UTC

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
      apt-get update && \
      apt-get install -y  \
          build-essential \
          gcc \
          g++ \
          clang \
          gdb \
          clang \
          make \
          ninja-build \
          cmake \
          autoconf \
          automake \
          libtool \
          valgrind \
          locales-all \
          dos2unix \
          rsync \
          tar \
          python \
          python-dev \
          tzdata \
          valgrind \
          wget

RUN apt-get clean
