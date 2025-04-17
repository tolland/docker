FROM tolland/fedora-41-cuda-rpm-min:latest

USER root

COPY oneAPI.repo /etc/yum.repos.d/oneAPI.repo

RUN rpm --import https://yum.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB

RUN --mount=type=cache,target=/var/cache/libdnf5,sharing=locked \
        dnf install -y \
            blas \
            blas-devel \
            blas-static \
            gflags-devel \
            intel-oneapi-mkl \
            intel-oneapi-mkl-devel \
            libcurand-devel-12-8 \
            lapack-devel \
            pkgconf-pkg-config \
            python-devel \
            python-pip \
            python-wheel \
            python3-numpy \
            python3-setuptools \
            swig

USER builder
