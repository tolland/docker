FROM fedora:41

# Update the package manager and install essential tools
RUN dnf update -y && \
    dnf install -y dnf-plugins-core

# Add the NVIDIA CUDA repository
RUN dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora40/x86_64/cuda-fedora40.repo && \
    dnf config-manager --set-enabled cuda-fedora40-x86_64

# Add the NVIDIA CUDA repository
RUN dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora39/x86_64/cuda-fedora39.repo && \
    dnf config-manager --set-enabled cuda-fedora39-x86_64

# Optionally add the NVIDIA container toolkit repo (if needed for GPU runtime support)
RUN dnf config-manager --add-repo https://nvidia.github.io/libnvidia-container/stable/rpm/nvidia-container-toolkit.repo && \
    dnf config-manager --set-enabled nvidia-container-toolkit

# Install the CUDA Toolkit
RUN dnf install -y cuda-toolkit && \
    dnf clean all

# Set environment variables for CUDA
ENV PATH=/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}

# Verify the installation (optional)
RUN nvcc --version
