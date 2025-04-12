FROM tolland/fedora-builder:40

RUN --mount=type=cache,target=/var/cache/dnf,sharing=locked \
    ls -lah /var/cache/dnf

# Install common build tools and development packages
RUN --mount=type=cache,target=/var/cache/dnf,sharing=locked \
    dnf install -y \
    make \
    gcc-c++ \
    which \
    kmod \
    kernel-devel

RUN dnf clean all

# Set default working directory
WORKDIR /build
