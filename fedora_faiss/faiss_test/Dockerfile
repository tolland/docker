FROM faiss_fedora-fedora41-cuda-runfile:latest

COPY faiss_test/oneAPI.repo /etc/yum.repos.d/oneAPI.repo

RUN dnf install -y \
    blas-devel \
    cmake \
    dnf-plugins-core \
    gcc-c++ \
    gflags-devel \
    git \
    intel-oneapi-mkl \
    intel-oneapi-mkl-devel \
    lapack-devel \
    pkgconf-pkg-config \
    python \
    python-devel \
    python-pip \
    python3-numpy \
    swig


# Clone FAISS repository
RUN git clone --depth 1  --single-branch https://github.com/facebookresearch/faiss.git /faiss

# Set environment variables for Intel MKL
ENV MKLROOT=/opt/intel/oneapi/mkl/latest
ENV LD_LIBRARY_PATH=$MKLROOT/lib/intel64:$LD_LIBRARY_PATH
ENV LIBRARY_PATH=$MKLROOT/lib/intel64:$LIBRARY_PATH
ENV CPATH=$MKLROOT/include:$CPATH

RUN pkg-config --cflags --libs python3

LABEL stage=here

# Build FAISS
WORKDIR /faiss
RUN CUDACXX=/usr/local/cuda/bin/nvcc cmake -B build \
     -DFAISS_ENABLE_GPU=ON \
     -DFAISS_ENABLE_PYTHON=ON \
     -DFAISS_ENABLE_C_API=OFF \
     -DBUILD_SHARED_LIBS=O \
     -DBUILD_TESTING=OFF \
     -DCMAKE_BUILD_TYPE=Release \
     -DCMAKE_INSTALL_PREFIX=/usr/local \
     -DFAISS_OPT_LEVEL=generic \
     -DCMAKE_CXX_STANDARD=17
    # -DCMAKE_CUDA_ARCHITECTURES=native

RUN cmake --build build --config Release -j4
RUN cmake --install build

CMD ["top", "-b"]

