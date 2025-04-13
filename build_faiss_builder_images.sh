#/bin/bash

set -eu

docker compose -f ./0_base/docker-compose.yml build fedora-41-base
docker compose -f ./10_toolchains/docker-compose.yml build \
    fedora-41-builder \
    fedora-41-builder-kmod \
    fedora-41-cpp
docker compose -f ./50_fedora_cuda/docker-compose.yml build \
    fedora-41-cuda-rpm-min
docker compose -f ./51_faiss/docker-compose.yml build \
    fedora-41-faiss-builder
