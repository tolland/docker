FROM tolland/ubuntu-24:latest

ARG DEBIAN_FRONTEND="noninteractive"
ENV TZ=Etc/UTC

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
      apt-get update && \
      apt-get install -y --no-install-recommends  \
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
          tzdata \
          valgrind

RUN apt-get clean
