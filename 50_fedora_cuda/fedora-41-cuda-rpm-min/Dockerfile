FROM tolland/fedora-41-cpp:latest

USER root

# Add the NVIDIA CUDA repository
RUN --mount=type=cache,target=/var/cache/libdnf5,sharing=locked \
        dnf config-manager \
        addrepo \
        --from-repofile https://developer.download.nvidia.com/compute/cuda/repos/fedora41/x86_64/cuda-fedora41.repo

# Install the CUDA Toolkit
RUN --mount=type=cache,target=/var/cache/libdnf5,sharing=locked \
    dnf install -y \
        cuda-minimal-build-12-8 \
        libcublas-devel-12-8

COPY cuda_test.py /usr/local/bin/

# COPY inspect_cache.sh /usr/local/bin/
# RUN --mount=type=cache,target=/var/cache/libdnf5,sharing=locked \
#     chmod +x /usr/local/bin/inspect_cache.sh && \
#     /usr/local/bin/inspect_cache.sh

# Set environment variables for CUDA
ENV PATH=/usr/local/cuda-12.8/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/cuda-12.8/lib64:${LD_LIBRARY_PATH}

RUN nvcc --version

RUN dnf clean all

USER builder
