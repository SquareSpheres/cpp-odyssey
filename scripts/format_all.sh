#!/bin/bash
# Format all C++ source files

set -e

echo "=== Formatting all C++ files ==="

find . -name "*.cpp" -o -name "*.hpp" -o -name "*.h" | \
    grep -v "build/" | \
    xargs clang-format -i

echo "=== Formatting complete ==="

