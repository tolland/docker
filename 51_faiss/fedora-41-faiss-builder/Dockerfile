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
            swig

RUN --mount=type=cache,target=/var/cache/libdnf5,sharing=locked \
    dnf install -y \
        openblas-static \
        blas64.x86_64 \
        blas-static \
        blas \
        blas-devel \
        openblas-devel \
        openblas \
        lapack-devel


#
# DIAGUTIL_PATH=/opt/intel/oneapi/compiler/2025.1/etc/compiler/sys_check/sys_check.sh
# MANPATH=/opt/intel/oneapi/compiler/2025.1/share/man:
# TCM_ROOT=/opt/intel/oneapi/tcm/1.3
# TBBROOT=/opt/intel/oneapi/tbb/2022.1/env/..
# ONEAPI_ROOT=/opt/intel/oneapi
# PKG_CONFIG_PATH=/opt/intel/oneapi/tbb/2022.1/env/../lib/pkgconfig:/opt/intel/oneapi/mkl/2025.1/lib/pkgconfig:/opt/intel/oneapi/compiler/2025.1/lib/pkgconfig
#SETVARS_COMPLETED=1
# CMAKE_PREFIX_PATH=/opt/intel/oneapi/tbb/2022.1/env/..:/opt/intel/oneapi/mkl/2025.1/lib/cmake:/opt/intel/oneapi/compiler/2025.1
# CMPLR_ROOT=/opt/intel/oneapi/compiler/2025.1

# UMF_ROOT=/opt/intel/oneapi/umf/0.10
# LIBRARY_PATH=/opt/intel/oneapi/tcm/1.3/lib:/opt/intel/oneapi/umf/0.10/lib:/opt/intel/oneapi/tbb/2022.1/env/../lib/intel64/gcc4.8:/opt/intel/oneapi/mkl/2025.1/lib:/opt/intel/oneapi/compiler/2025.1/lib

# OCL_ICD_FILENAMES=/opt/intel/oneapi/compiler/2025.1/lib/libintelocl.so
# LD_LIBRARY_PATH=/opt/intel/oneapi/tcm/1.3/lib:/opt/intel/oneapi/umf/0.10/lib:/opt/intel/oneapi/tbb/2022.1/env/../lib/intel64/gcc4.8:/opt/intel/oneapi/mkl/2025.1/lib:/opt/intel/oneapi/compiler/2025.1/opt/compiler/lib:/opt/intel/oneapi/compiler/2025.1/lib:/usr/local/cuda-12.8/lib64:
# MKLROOT=/opt/intel/oneapi/mkl/2025.1

# NLSPATH=/opt/intel/oneapi/compiler/2025.1/lib/compiler/locale/%l_%t/%N
# PATH=/opt/intel/oneapi/mkl/2025.1/bin:/opt/intel/oneapi/compiler/2025.1/bin:/root/.local/bin:/root/bin:/usr/local/cuda-12.8/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# CPATH=/opt/intel/oneapi/umf/0.10/include:/opt/intel/oneapi/tbb/2022.1/env/../include:/opt/intel/oneapi/mkl/2025.1/include

# Set environment variables for Intel MKL
# ENV MKLROOT=/opt/intel/oneapi/mkl/latest
# ENV LD_LIBRARY_PATH=$MKLROOT/lib/intel64:$LD_LIBRARY_PATH
# ENV LIBRARY_PATH=$MKLROOT/lib/intel64:$LIBRARY_PATH
# ENV CPATH=$MKLROOT/include:$CPATH

WORKDIR /faiss

