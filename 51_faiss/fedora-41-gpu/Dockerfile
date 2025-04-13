FROM tolland/fedora-41-faiss-builder:latest

# Build FAISS
WORKDIR /faiss

# Clone FAISS repository
# RUN git clone \
#     --depth 1 \
#     --single-branch https://github.com/facebookresearch/faiss.git \
#     /faiss

RUN pkg-config --cflags --libs python3

LABEL stage=here

# RUN --mount=type=cache,target=/var/cache/libdnf5,sharing=locked \
#     dnf install -y \
#     libcublas-devel-12-8


RUN CUDACXX=/usr/local/cuda/bin/nvcc cmake -B build \
    -DFAISS_ENABLE_GPU=ON \
    -DFAISS_ENABLE_PYTHON=ON \
    -DFAISS_ENABLE_C_API=OFF \
    -DBUILD_SHARED_LIBS=O \
    -DBUILD_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DFAISS_OPT_LEVEL=avx2 \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CUDA_ARCHITECTURES="75;80;86;89"

RUN cmake --build build --config Release -j4
RUN cmake --install build

CMD ["top", "-b"]

