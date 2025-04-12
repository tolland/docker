#!/bin/bash

# Function to process a single directory
process_dir() {
    local dir="$1"
    echo "Processing ${dir}"
    (cd "${dir}" && \
        echo "Pulling images in ${dir}..." && \
        docker compose pull && \
        echo "Building services in ${dir}..." && \
        docker compose build)
    echo "----------------------------------------"
}

# Export the function so it's available to parallel
export -f process_dir

# Find all directories with docker-compose.yml files (depth=1) and process them in parallel
find . -maxdepth 1 -type d -not -path "*/\.*" -print0 | \
    parallel -0 --will-cite --jobs 0 'if [ -f "{}/docker-compose.yml" ]; then process_dir "{}"; fi'

echo "All services updated!"
