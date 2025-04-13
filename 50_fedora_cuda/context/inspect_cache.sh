#!/bin/bash

echo "=== Build Cache Inspection ==="
echo

# echo "1. Build cache disk usage:"
# docker buildx du

# echo
# echo "2. Detailed build cache information:"
# docker buildx inspect

echo
echo "3. Cache mounts in current container:"
mount | grep cache

echo
echo "4. DNF cache contents:"
ls -la /var/cache/dnf/
