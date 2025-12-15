# Development Environment Setup

## Required Tools

### Compiler
- **Linux:** GCC 9+ or Clang 10+
- **macOS:** Xcode Command Line Tools (Clang)
- **Windows:** MSVC 2019+ or MinGW-w64

### Build System
- CMake 3.20 or later

### Optional Tools
- clang-format (for code formatting)
- clang-tidy (for static analysis)
- gdb or lldb (debugger)
- valgrind (memory analysis, Linux only)

## Setup Instructions

### Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install build-essential cmake git
sudo apt install clang-format clang-tidy  # Optional
```

### macOS
```bash
xcode-select --install
brew install cmake
brew install clang-format  # Optional
```

### Windows
1. Install Visual Studio 2019+ with C++ Desktop Development
2. Install CMake from https://cmake.org/download/
3. Optional: Install vcpkg for package management

## Building the Projects

```bash
# Create build directory
mkdir build && cd build

# Configure
cmake ..

# Build
cmake --build .

# Run tests
ctest --output-on-failure
```

## IDE Setup

### Visual Studio Code
Install extensions:
- C/C++ (Microsoft)
- CMake Tools
- clangd (optional, better than C/C++ IntelliSense)

### CLion
Works out of the box with CMake projects.

### Visual Studio
Open the folder containing `CMakeLists.txt` - CMake integration is built-in.

## Sanitizer Configuration

```bash
# Address and undefined behavior sanitizers
cmake -DENABLE_SANITIZERS=ON ..

# Thread sanitizer (use separately)
cmake -DENABLE_THREAD_SANITIZER=ON ..
```

## Troubleshooting

### CMake can't find compiler
Set manually:
```bash
cmake -DCMAKE_CXX_COMPILER=/usr/bin/g++-11 ..
```

### Missing networking libraries
- Linux: Should be included with glibc
- Windows: Link against ws2_32.lib (handled in CMake)
- macOS: Included with system

### Build errors
- Clear build directory: `rm -rf build/*`
- Check compiler version: `g++ --version` or `clang++ --version`
- Verify CMake version: `cmake --version`

