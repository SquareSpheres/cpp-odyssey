#!/bin/bash
# Run clang-tidy on all projects

set -e

BUILD_DIR="${1:-build}"

if [ ! -d "$BUILD_DIR" ]; then
    echo "Build directory not found: $BUILD_DIR"
    echo "Please build the project first"
    exit 1
fi

echo "=== Running clang-tidy ==="

find . -name "*.cpp" | \
    grep -v "build/" | \
    grep -v "tests/" | \
    xargs clang-tidy -p "$BUILD_DIR"

echo "=== Linting complete ==="

