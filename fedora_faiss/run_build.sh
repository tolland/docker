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

echo "🔁 Cleaning up existing builder (if any)..."
docker buildx stop "$BUILDER_NAME" || true
docker buildx rm "$BUILDER_NAME" || true

echo "📝 Creating BuildKit config file: $BUILDKITD_CONFIG"
cat > "$BUILDKITD_CONFIG" <<EOF
[worker.oci]
  enabled = true
  platforms = ["linux/amd64"]

[worker.oci.entitlements]
  security.insecure = true
EOF

echo "🚀 Creating new builder: $BUILDER_NAME"
docker buildx create \
  --name "$BUILDER_NAME" \
  --driver docker-container \
  --buildkitd-flags "--config $BUILDKITD_CONFIG --allow-insecure-entitlement=security.insecure" \
  --driver-opt "mount=$HOST_CACHE_DIR:$HOST_CACHE_DIR" \
  --use


docker buildx inspect --bootstrap

echo "🔨 Running the build with host bind-mount: $HOST_CACHE_DIR -> $MOUNT_TARGET"

set +x

docker buildx build \
  --allow security.insecure \
  --build-arg CUDA_INSTALLER_PATH="$HOST_CACHE_DIR" \
  --progress=plain \
  -f "$DOCKERFILE" "$CONTEXT_DIR"
