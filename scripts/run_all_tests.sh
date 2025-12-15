#!/bin/bash
# Run all tests across all projects

set -e

BUILD_DIR="${1:-build}"

if [ ! -d "$BUILD_DIR" ]; then
    echo "Build directory not found: $BUILD_DIR"
    echo "Usage: $0 [build_directory]"
    exit 1
fi

cd "$BUILD_DIR"
echo "=== Running all tests ==="
ctest --output-on-failure --verbose
echo "=== All tests complete ==="

