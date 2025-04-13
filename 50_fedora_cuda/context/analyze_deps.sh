#!/bin/bash

echo "=== Analyzing CUDA Toolkit Dependencies ==="
echo

echo "1. What would be installed with cuda-toolkit:"
dnf repoquery --requires cuda-toolkit

echo
echo "2. What requires cuda-toolkit:"
dnf repoquery --whatrequires cuda-toolkit

echo
echo "3. Currently installed packages:"
dnf list installed

echo
echo "4. Why specific packages were installed:"
for pkg in pipewire java; do
    echo "--- $pkg ---"
    dnf repoquery --whatrequires $pkg 2>/dev/null || echo "Not installed or no requirements found"
done

echo
echo "5. Detailed package info for cuda-toolkit:"
dnf info cuda-toolkit 