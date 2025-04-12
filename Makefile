
DOCKER_COMPOSE=docker compose

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: fedora40-run-cuda
fedora40-run-cuda:
	echo $(ROOT_DIR)
	@echo "Configuring FAISS from submodule..."

	sh -c "pwd"

	docker build \
		-t fedora40-cuda:latest \
		-f fedora40-run-cuda/Dockerfile \
		build
