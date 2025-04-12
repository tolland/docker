FROM tolland/fedora:40

# Add the NVIDIA CUDA repository
# This doesn't seem to have the toolkit in it. However the 39 or 41 does.
RUN dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora40/x86_64/cuda-fedora40.repo && \
    dnf config-manager --set-enabled cuda-fedora40-x86_64

# Add the NVIDIA CUDA repository - this seems to be required.
# This is the 39 version. Seems to work with 40.
RUN dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora39/x86_64/cuda-fedora39.repo && \
    dnf config-manager --set-enabled cuda-fedora39-x86_64

# RUN dnf config-manager \
#     addrepo \
#         --from-repofile https://developer.download.nvidia.com/compute/cuda/repos/fedora41/x86_64/cuda-fedora41.repo

# Install CUDA toolkit
RUN dnf install -y cuda-toolkit

# Copy the test script from context
COPY cuda_test.py /usr/local/bin/

# Set environment variables for CUDA
ENV PATH=/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}

# Set the entrypoint to run the test
ENTRYPOINT ["python3", "/usr/local/bin/cuda_test.py"]
