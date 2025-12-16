#!/bin/bash
set -e

echo "=== Formatting all C++ files ==="

find . -type f \( -name "*.cpp" -o -name "*.hpp" -o -name "*.h" \) \
    -not -path "*/build/*" \
    -not -path "*/cmake-build-*/*" \
    -not -path "*/_deps/*" \
    -not -path "*/CMakeFiles/*" \
    -print0 | xargs -0 -r clang-format -i

echo "=== Formatting complete ==="
