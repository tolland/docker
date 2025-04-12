FROM fedora:41
LABEL authors="tolland"

# Update the package manager and install essential tools
RUN --mount=type=cache,target=/var/cache/dnf \
    dnf update -y && \
    dnf install -y \
      dnf-plugins-core \
      python3 \
      python3-pip \
      which

RUN dnf clean all
