FROM tolland/fedora-41-cuda-rpm-min:latest

COPY oneAPI.repo /etc/yum.repos.d/oneAPI.repo

RUN --mount=type=cache,target=/var/cache/libdnf5,sharing=locked \
        dnf install -y \
            gflags-devel \
            intel-oneapi-mkl \
            intel-oneapi-mkl-devel \
            pkgconf-pkg-config \
            python-devel \
            python-pip \
            python-wheel \
            python3-numpy \
            python3-setuptools \
            swig \
            blas-static \
            blas \
            blas-devel \
            lapack-devel \
            libcurand-devel-12-8
