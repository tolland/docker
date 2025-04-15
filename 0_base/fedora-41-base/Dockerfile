FROM fedora:41

# Update the package manager and install essential tools
RUN --mount=type=cache,target=/var/cache/libdnf5,sharing=locked \
    dnf update -y && \
    dnf install -y \
      dnf-plugins-core \
      file \
      git \
      python3 \
      python3-pip \
      procps-ng \
      which

RUN dnf config-manager setopt install_weak_deps=false

RUN dnf clean all
