FROM tolland/fedora:41

# Install common build tools and development packages
RUN --mount=type=cache,target=/var/cache/dnf \
    dnf install -y \
    autoconf \
    automake \
    binutils \
    bison \
    cmake \
    flex \
    gcc \
    gcc-c++ \
    git \
    libtool \
    make \
    pkgconf-pkg-config \
    python3 \
    python3-devel \
    python3-pip

RUN dnf clean all

# Set default working directory
WORKDIR /build
