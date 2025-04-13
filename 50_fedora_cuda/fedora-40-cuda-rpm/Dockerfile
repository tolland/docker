FROM tolland/fedora-builder-kmod:40

# Add the NVIDIA CUDA repository
# This doesn't seem to have the toolkit in it. However the 39 or 41 does.

RUN --mount=type=cache,target=/var/cache/dnf,sharing=locked \
    dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora40/x86_64/cuda-fedora40.repo && \
    dnf config-manager --set-enabled cuda-fedora40-x86_64

# Add the NVIDIA CUDA repository - this seems to be required.
# This is the 39 version. Seems to work with 40.
RUN --mount=type=cache,target=/var/cache/dnf,sharing=locked \
    dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora39/x86_64/cuda-fedora39.repo && \
    dnf config-manager --set-enabled cuda-fedora39-x86_64

# RUN dnf config-manager \
#     addrepo \
#         --from-repofile https://developer.download.nvidia.com/compute/cuda/repos/fedora41/x86_64/cuda-fedora41.repo


RUN --mount=type=cache,target=/var/cache/libdnf5,sharing=locked \
    dnf install -y \
    gcc13-c++


# Install CUDA toolkit
RUN --mount=type=cache,target=/var/cache/dnf,sharing=locked \
    dnf install -y \
    cuda-toolkit

# Set environment variables for CUDA
ENV PATH=/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}

# Copy the test script from context
COPY cuda_test.py /usr/local/bin/

ENV NVCC_CCBIN='g++-13'

RUN nvcc --version

RUN dnf clean all
