FROM tolland/ubuntu-24:latest

ARG DEBIAN_FRONTEND="noninteractive"
ENV TZ=Etc/UTC

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
      apt-get update && \
      apt-get install -y --no-install-recommends  \
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
          python3-dev \
          tzdata \
          valgrind \
          wget

RUN apt-get clean
