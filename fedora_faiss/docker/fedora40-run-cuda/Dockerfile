FROM fedora:40
LABEL authors="tolland"

# Update the package manager and install essential tools
RUN dnf update -y && \
    dnf install -y \
        dnf-plugins-core \
        make \
        gcc13-c++ \
        which \
        kmod


WORKDIR /app

RUN mkdir /app/tmp /app/tmp2

COPY cuda_12.8.1_570.124.06_linux.run /app/tmp/cuda_12.8.1_570.124.06_linux.run

# # Optionally add the NVIDIA container toolkit repo (if needed for GPU runtime support)
# RUN dnf config-manager --add-repo https://nvidia.github.io/libnvidia-container/stable/rpm/nvidia-container-toolkit.repo && \
#     dnf config-manager --set-enabled nvidia-container-toolkit

# Install the CUDA Toolkit
RUN chmod +x /app/tmp/cuda_12.8.1_570.124.06_linux.run && \
    /app/tmp/cuda_12.8.1_570.124.06_linux.run  \
           --silent \
           --toolkit \
           --no-man-page \
           --no-opengl-libs \
            --kernel-source-path=$(rpm -ql kernel-devel | grep /usr/src/kernels/ | sort | tail -n 1)

# Set environment variables for CUDA
# ENV PATH=/usr/local/cuda/bin:${PATH}
# ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}

# Verify the installation (optional)
CMD top -b
