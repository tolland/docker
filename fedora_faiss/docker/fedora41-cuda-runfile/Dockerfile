FROM fedora:41
LABEL authors="tolland"

# Update the package manager and install essential tools
RUN dnf update -y && \
    dnf install -y \
        dnf-plugins-core \
        make \
        gcc-c++ \
        which \
        kmod \
        kernel-devel

WORKDIR /app

RUN mkdir /app/installer /app/tmp

ARG CUDA_INSTALLER_PATH

RUN --mount=type=bind,from=cuda_installer,target=/app/installer \
        /app/installer/cuda_*.run \
            --silent \
            --toolkit \
            --no-man-page \
            --no-opengl-libs \
            --tmpdir=/app/tmp

ENV PATH=/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}

CMD top -b
