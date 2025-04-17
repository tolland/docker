FROM tolland/fedora-41-builder:latest

USER root

# Install common build tools and development packages
RUN --mount=type=cache,target=/var/cache/libdnf5,sharing=locked \
    dnf install -y \
    make \
    gcc-c++ \
    which \
    kmod \
    kernel-devel

RUN dnf clean all

# Set default working directory
WORKDIR /build

USER builder