FROM tolland/fedora-builder-kmod:41

# Add the NVIDIA CUDA repository
RUN dnf config-manager \
    --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora41/x86_64/cuda-fedora41.repo && \
    dnf config-manager --set-enabled cuda-fedora41-x86_64

# Install the CUDA Toolkit
RUN --mount=type=cache,target=/var/cache/dnf dnf install -y \
    cuda-toolkit && \
    dnf clean all

# Set environment variables for CUDA
ENV PATH=/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}

# Verify the installation (optional)
RUN nvcc --version
