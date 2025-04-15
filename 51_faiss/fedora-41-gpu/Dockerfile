FROM tolland/fedora-41-faiss-builder:latest

# Build FAISS
WORKDIR /build

# Clone FAISS builder repository
RUN git clone \
    --depth 1 \
    --single-branch https://github.com/tolland/faiss-builder.git \
    /build


RUN /build/00_checkout.sh && \
    /build/01_venv.sh && \
    /build/10_build_numpy.sh

RUN bash -c "cat /build/numpy/pyproject.toml | grep version"

RUN find /build/numpy/dist && /build/11_install_mkl_numpy.sh

RUN /build/21_configure.sh
RUN /build/22_build.sh
RUN /build/23_package.sh
RUN ls -lah && /build/24_install_package.sh

RUN git pull

RUN /build/25_test_package.sh

# RUN ls -lah && \
#     ls /build && \
#     set -x ; /build/build_all.sh



