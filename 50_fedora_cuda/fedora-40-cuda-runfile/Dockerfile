FROM tolland/fedora-builder-kmod:40

ARG CUDA_RUNFILE_VERSION=12.8.1_570.124.06

WORKDIR /app

RUN mkdir /app/tmp

# Install the CUDA Toolkit
RUN --mount=type=bind,from=cuda_installer,target=/app/installer \
        /app/installer/cuda_${CUDA_RUNFILE_VERSION}_linux.run \
           --silent \
           --toolkit \
           --no-man-page \
           --no-opengl-libs \
            --kernel-source-path=$(rpm -ql kernel-devel | grep /usr/src/kernels/ | sort | tail -n 1)

# Set environment variables for CUDA
ENV PATH=/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}

RUN nvcc --version
# Verify the installation (optional)
CMD top -b
