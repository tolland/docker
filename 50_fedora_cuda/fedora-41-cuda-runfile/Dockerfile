FROM tolland/fedora-builder-kmod:41

ARG CUDA_RUNFILE_VERSION=12.8.1_570.124.06

WORKDIR /app

RUN mkdir /app/installer /app/tmp

RUN --mount=type=bind,from=cuda_installer,target=/app/installer \
        /app/installer/cuda_${CUDA_RUNFILE_VERSION}_linux.run \
            --silent \
            --toolkit \
            --no-drm \
            --no-man-page \
            --no-opengl-libs \
            --tmpdir=/app/tmp

ENV PATH=/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}

RUN nvcc --version
CMD top -b
