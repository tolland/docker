FROM tolland/fedora:40

ARG CONTAINER_UID=1000
ARG CONTAINER_GID=1000

USER root

# Install common build tools and development packages
RUN --mount=type=cache,target=/var/cache/dnf,sharing=locked \
    dnf install -y \
    autoconf \
    automake \
    binutils \
    bison \
    ccache \
    clang \
    cmake \
    dos2unix \
    flex \
    gcc \
    gcc-c++ \
    gdb \
    gflags-devel \
    git \
    libtool \
    make \
    ninja-build \
    pkgconf-pkg-config \
    python3 \
    python3-devel \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    rsync \
    sed \
    swig \
    tzdata \
    valgrind \
    wget

RUN dnf clean all

# ubuntu already has user ubuntu with uid 1000
RUN useradd -m -u ${CONTAINER_UID} -s /bin/bash builder
WORKDIR /build
USER builder
