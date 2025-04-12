#!/usr/bin/env bash
set -euo pipefail

# -------- CONFIG --------
BUILDER_NAME="mybuilder"
BUILDKITD_CONFIG="./buildkitd.toml"
DOCKERFILE="docker/fedora41-cuda-runfile/Dockerfile"
CONTEXT_DIR="./docker"
HOST_CACHE_DIR="$(realpath ./cache)"
MOUNT_TARGET="/app/installer"
# ------------------------


docker buildx build \
  --build-arg CUDA_INSTALLER_PATH="$(realpath ./cache)" \
  -f "$DOCKERFILE" "$CONTEXT_DIR" \
  --progress=plain \
  --load