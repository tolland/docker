#!/bin/bash

set -eu

# Build and test base image
docker compose --profile base -f ./0_base/docker-compose.yml build fedora-41-base
docker compose --profile base -f ./0_base/docker-compose.yml run -it --rm fedora-41-base id

# Build and test toolchain images
TOOLCHAIN_IMAGES=(
    "fedora-41-builder"
    "fedora-41-builder-kmod"
    "fedora-41-cpp"
)

for IMAGE in "${TOOLCHAIN_IMAGES[@]}"; do
    echo "Building $IMAGE"
    docker compose -f ./10_toolchains/docker-compose.yml build "$IMAGE"
    echo "Testing $IMAGE"
    docker compose -f ./10_toolchains/docker-compose.yml run -it --rm "$IMAGE" id
done

# Build and test CUDA and FAISS images
declare -A COMPOSE_FILES=(
    ["fedora-41-cuda-rpm-min"]="./50_fedora_cuda/docker-compose.yml"
    ["fedora-41-faiss-builder"]="./51_faiss/docker-compose.yml"
)

for IMAGE in "${!COMPOSE_FILES[@]}"; do
    COMPOSE_FILE="${COMPOSE_FILES[$IMAGE]}"

    echo "Building $IMAGE"
    docker compose -f "$COMPOSE_FILE" build "$IMAGE"

    echo "Testing $IMAGE"
    docker compose -f "$COMPOSE_FILE" run -it --rm "$IMAGE" id
done

# echo "Starting build instance"
# docker compose -f ./51_faiss/docker-compose.yml up -d fedora-41-faiss-gpu-build