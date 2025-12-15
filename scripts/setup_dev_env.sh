#!/bin/bash
# Development environment setup script

set -e

echo "=== C++ Odyssey Development Environment Setup ==="

# Detect OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Detected Linux"
    sudo apt-get update
    sudo apt-get install -y build-essential cmake git clang-format clang-tidy
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected macOS"
    xcode-select --install || true
    brew install cmake clang-format
else
    echo "Unsupported OS: $OSTYPE"
    exit 1
fi

echo "=== Setup Complete ==="
echo "Run 'mkdir build && cd build && cmake ..' to configure"

