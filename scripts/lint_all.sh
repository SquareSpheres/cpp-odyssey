#!/bin/bash
set -e

BUILD_DIR="${1:-build}"

if [ ! -d "$BUILD_DIR" ]; then
    echo "Build directory not found: $BUILD_DIR"
    echo "Please build the project first"
    exit 1
fi

echo "=== Running clang-tidy ==="

find . -type f -name "*.cpp" \
    -not -path "*/build/*" \
    -not -path "*/cmake-build-*/*" \
    -not -path "*/_deps/*" \
    -not -path "*/CMakeFiles/*" \
    -not -path "*/tests/*" \
    -print0 | xargs -0 -r clang-tidy -p "$BUILD_DIR"

echo "=== Linting complete ==="
