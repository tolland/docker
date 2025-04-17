FROM tolland/fedora-41-faiss-builder:latest

# Build FAISS
WORKDIR /build


# Clone FAISS builder repository
RUN git clone \
    --depth 1 \
    --single-branch https://github.com/tolland/faiss-builder.git \
    /build/faiss-builder && \
    mkdir -p /build/faiss-builder/build

USER root
RUN chown -R builder /build
USER builder

WORKDIR /build/faiss-builder
