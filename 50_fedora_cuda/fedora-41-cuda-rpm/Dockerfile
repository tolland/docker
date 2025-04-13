FROM tolland/fedora-builder-kmod:41

# Add the NVIDIA CUDA repository
RUN --mount=type=cache,target=/var/cache/libdnf5,sharing=locked \
    dnf config-manager \
    addrepo \
    --from-repofile  https://developer.download.nvidia.com/compute/cuda/repos/fedora41/x86_64/cuda-fedora41.repo

# Install the CUDA Toolkit
RUN --mount=type=cache,target=/var/cache/libdnf5,sharing=locked \
    dnf install -y \
    cuda-toolkit

# Set environment variables for CUDA
ENV PATH=/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}

RUN dnf clean all

# Verify the installation (optional)
RUN nvcc --version
