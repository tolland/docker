FROM tolland/fedora-builder-kmod:41

LABEL org.opencontainers.image.title="Fedora 41 C++ Toolchain" \
  org.opencontainers.image.description="This Dockerfile builds a container image for a Fedora 41-based C++ development toolchain. It includes common build tools, compilers, and libraries for C++ development. Is created for clion integration specifically" \
  org.opencontainers.image.version="1.0" \
  org.opencontainers.image.licenses="MIT"

# Install common build tools and development packages
RUN --mount=type=cache,target=/var/cache/libdnf5,sharing=locked \
    dnf install -y \
    autoconf \
    automake \
    binutils \
    bison \
    clang \
    cmake \
    flex \
    gcc \
    gcc-c++ \
    gdb-15.1-1.fc41 \
    gflags-devel \
    libtool \
    ninja-build \
    pkgconf-pkg-config \
    python3-devel \
    python3-setuptools \
    python3-wheel \
    rsync \
    sed \
    swig \
    tzdata \
    valgrind \
    wget

RUN dnf clean all
