FROM tolland/fedora-41:latest

# Install common build tools and development packages
RUN --mount=type=cache,target=/var/cache/libdnf5,sharing=locked \
    dnf install -y \
    autoconf \
    automake \
    binutils \
    bison \
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

# Set default working directory
WORKDIR /build
