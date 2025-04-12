FROM tolland/fedora-builder-kmod:41

# Add the NVIDIA CUDA repository
RUN --mount=type=cache,target=/var/cache/dnf \
        dnf config-manager \
        addrepo \
        --from-repofile  https://developer.download.nvidia.com/compute/cuda/repos/fedora41/x86_64/cuda-fedora41.repo

# Install the CUDA Toolkit
RUN --mount=type=cache,target=/var/cache/dnf \
    dnf install -y \
    cuda-minimal-build-12-8

COPY cuda_test.py /usr/local/bin/
COPY inspect_cache.sh /usr/local/bin/

RUN --mount=type=cache,target=/var/cache/dnf \
    chmod +x /usr/local/bin/inspect_cache.sh && \
    /usr/local/bin/inspect_cache.sh

# Set environment variables for CUDA
ENV PATH=/usr/local/cuda-12.8/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/cuda-12.8/lib64:${LD_LIBRARY_PATH}

RUN dnf clean all
RUN nvcc --version
