# C++ Learning Monorepo Scaffolding Prompt

Create a complete directory structure and configuration files for a C++ learning monorepo called "cpp-forge". Follow these exact specifications:

## Directory Structure

Create the following directory tree (all folders should be empty except where files are specified):

```
cpp-forge/
├── .github/
│   ├── workflows/
│   └── ISSUE_TEMPLATE/
├── docs/
│   └── reflections/
├── shared/
│   ├── include/
│   │   └── common/
│   └── src/
├── project1-ping-pong/
│   ├── include/
│   │   └── pingpong/
│   ├── src/
│   ├── tests/
│   ├── docs/
│   └── examples/
├── project2-chat-server/
│   ├── include/
│   │   └── chat/
│   ├── src/
│   ├── tests/
│   └── docs/
├── project3-file-io/
│   ├── include/
│   │   └── fileio/
│   ├── src/
│   ├── tests/
│   ├── docs/
│   └── sample_files/
├── project4-template-library/
│   ├── include/
│   │   └── utils/
│   ├── tests/
│   ├── examples/
│   ├── docs/
│   └── benchmarks/
├── project5-event-system/
│   ├── include/
│   │   └── events/
│   ├── src/
│   ├── tests/
│   └── docs/
├── project6-webrtc-cli/
│   ├── include/
│   │   └── webrtc_cli/
│   ├── src/
│   ├── tests/
│   ├── docs/
│   └── config/
└── scripts/
```

## Files to Create

### Root Level Files

**1. `.gitignore`**
```gitignore
# Build directories
build/
cmake-build-*/
out/

# IDE files
.vscode/
.idea/
*.swp
*.swo
*~
.DS_Store

# Compiled files
*.o
*.a
*.so
*.dylib
*.dll
*.exe

# CMake
CMakeCache.txt
CMakeFiles/
cmake_install.cmake
install_manifest.txt
CTestTestfile.cmake
_deps/

# Testing
Testing/
*.gcda
*.gcno
*.gcov

# Sanitizer outputs
*.log
```

**2. `.clang-format`**
```yaml
---
Language: Cpp
BasedOnStyle: Google
IndentWidth: 4
TabWidth: 4
UseTab: Never
ColumnLimit: 100
AlignConsecutiveAssignments: true
AlignConsecutiveDeclarations: false
AllowShortFunctionsOnASingleLine: Empty
AllowShortIfStatementsOnASingleLine: Never
IndentCaseLabels: false
PointerAlignment: Left
NamespaceIndentation: None
```

**3. `.clang-tidy`**
```yaml
---
Checks: >
  -*,
  bugprone-*,
  cppcoreguidelines-*,
  modernize-*,
  performance-*,
  readability-*,
  -modernize-use-trailing-return-type,
  -readability-magic-numbers,
  -cppcoreguidelines-avoid-magic-numbers

WarningsAsErrors: ''
HeaderFilterRegex: '.*'
FormatStyle: file
```

**4. `CMakeLists.txt`** (Root)
```cmake
cmake_minimum_required(VERSION 3.20)
project(CppForge VERSION 1.0.0 LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Export compile commands for IDE integration
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Compiler warnings
if(MSVC)
    add_compile_options(/W4)
else()
    add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# Options
option(BUILD_TESTS "Build tests" ON)
option(BUILD_SHARED "Build shared utilities" ON)
option(ENABLE_SANITIZERS "Enable sanitizers (address, undefined)" OFF)
option(ENABLE_THREAD_SANITIZER "Enable thread sanitizer" OFF)

# Sanitizers (mutually exclusive with thread sanitizer)
if(ENABLE_SANITIZERS AND NOT ENABLE_THREAD_SANITIZER)
    if(CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR CMAKE_CXX_COMPILER_ID MATCHES "GNU")
        add_compile_options(-fsanitize=address,undefined -fno-omit-frame-pointer)
        add_link_options(-fsanitize=address,undefined)
    endif()
endif()

if(ENABLE_THREAD_SANITIZER)
    if(CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR CMAKE_CXX_COMPILER_ID MATCHES "GNU")
        add_compile_options(-fsanitize=thread -fno-omit-frame-pointer)
        add_link_options(-fsanitize=thread)
    endif()
endif()

# Shared utilities (optional)
if(BUILD_SHARED)
    add_subdirectory(shared)
endif()

# Projects
add_subdirectory(project1-ping-pong)
add_subdirectory(project2-chat-server)
add_subdirectory(project3-file-io)
add_subdirectory(project4-template-library)
add_subdirectory(project5-event-system)
add_subdirectory(project6-webrtc-cli)

# Testing
if(BUILD_TESTS)
    enable_testing()
    include(CTest)
endif()
```

**5. `README.md`** (Root)
```markdown
# cpp-forge

> A progressive C++ learning journey through 6 hands-on projects

## 🎯 Overview

This repository documents my journey learning modern C++ through increasingly complex projects, from basic networking to a full WebRTC application.

**Learning Rule:** No AI-generated code – only self-directed learning, research, and problem-solving.

## 📚 Projects

| # | Project | Status | Duration | Key Concepts |
|---|---------|--------|----------|--------------|
| 1 | [Ping-Pong Server](project1-ping-pong) | ⚪ Not Started | - | Sockets, RAII |
| 2 | [Chat Server](project2-chat-server) | ⚪ Not Started | - | Threading, Mutexes |
| 3 | [File I/O Tool](project3-file-io) | ⚪ Not Started | - | Smart Pointers, Move Semantics |
| 4 | [Template Library](project4-template-library) | ⚪ Not Started | - | Templates, Generic Programming |
| 5 | [Event System](project5-event-system) | ⚪ Not Started | - | Lambdas, Callbacks |
| 6 | [WebRTC CLI](project6-webrtc-cli) | ⚪ Not Started | - | Integration, Async I/O |

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/yourusername/cpp-forge.git
cd cpp-forge

# Build all projects
mkdir build && cd build
cmake ..
cmake --build .

# Run tests
ctest --output-on-failure

# With sanitizers
cmake -DENABLE_SANITIZERS=ON ..
cmake --build .
```

## 🛠️ Requirements

- C++17 or later
- CMake 3.20+
- A modern C++ compiler (GCC 9+, Clang 10+, MSVC 2019+)
- Platform-specific networking libraries (POSIX sockets or Winsock)

## 📖 Documentation

- [Full Roadmap](docs/README.md) - Complete learning path and project details
- [Development Setup](docs/setup.md) - Environment configuration
- [Learning Resources](docs/resources.md) - Books, articles, and references
- [Progress Journal](PROGRESS.md) - My learning progress and reflections

## 📝 Learning Rules

- ❌ No AI-generated code or solutions
- ✅ Basic IDE autocomplete allowed
- ✅ AI for explanations, code review, and research
- ✅ Goal: Learn by thinking and solving problems directly

## 🤝 Feedback

This is a personal learning repository. Feedback and suggestions are welcome via issues!

## 📄 License

MIT License - see [LICENSE](LICENSE) for details

---

**Started:** [Date]  
**Current Project:** Project 1 - TCP/UDP Ping-Pong Server
```

**6. `PROGRESS.md`**
```markdown
# Learning Progress

Track your journey through each project, challenges faced, and lessons learned.

## Project 1: TCP/UDP Ping-Pong Server
**Status:** ⚪ Not Started  
**Started:** -  
**Completed:** -

### Goals
- [ ] Build TCP echo server
- [ ] Build UDP packet counter
- [ ] Implement RAII socket wrapper
- [ ] Handle client disconnects gracefully

### Learning Log
*Document your progress, challenges, and breakthroughs here as you work.*

---

## Project 2: Multi-threaded Chat Server
**Status:** ⚪ Not Started  
**Started:** -  
**Completed:** -

### Goals
- [ ] Thread-per-client model
- [ ] Thread-safe message broadcasting
- [ ] Private messaging
- [ ] Graceful shutdown

### Learning Log
*Coming soon...*

---

## Project 3: File I/O and RAII
**Status:** ⚪ Not Started  
**Started:** -  
**Completed:** -

### Goals
- [ ] RAII file wrapper
- [ ] Chunked file processing
- [ ] File transformations
- [ ] Exception safety

### Learning Log
*Coming soon...*

---

## Project 4: Template-based Utility Library
**Status:** ⚪ Not Started  
**Started:** -  
**Completed:** -

### Goals
- [ ] Generic algorithms
- [ ] Serialization utilities
- [ ] Type-safe wrappers
- [ ] Template documentation

### Learning Log
*Coming soon...*

---

## Project 5: Simple Event-driven CLI App
**Status:** ⚪ Not Started  
**Started:** -  
**Completed:** -

### Goals
- [ ] Event loop implementation
- [ ] Task scheduler
- [ ] Lambda callbacks
- [ ] Async task handling

### Learning Log
*Coming soon...*

---

## Project 6: Complete CLI WebRTC App
**Status:** ⚪ Not Started  
**Started:** -  
**Completed:** -

### Goals
- [ ] Signaling implementation
- [ ] Peer connection management
- [ ] Data channel messaging
- [ ] File transfer
- [ ] Optional audio streaming

### Learning Log
*Coming soon...*

---

## Overall Statistics

- **Total Time Invested:** 0 hours
- **Projects Completed:** 0/6
- **Tests Written:** 0
- **Lines of Code:** 0
- **Major Bugs Fixed:** 0
- **Concepts Mastered:** []
```

**7. `LICENSE`**
```
MIT License

Copyright (c) 2024 [Your Name]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

### Documentation Files

**8. `docs/README.md`**
```markdown
# C++ Learning Roadmap

This is the complete roadmap document that outlines all six projects, their goals, and the concepts practiced.

[Copy the full roadmap content from the previous artifact here]
```

**9. `docs/setup.md`**
```markdown
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
```

**10. `docs/resources.md`**
```markdown
# Learning Resources

## Books

### Beginner to Intermediate
- **"A Tour of C++" by Bjarne Stroustrup** - Quick overview of modern C++
- **"Effective Modern C++" by Scott Meyers** - Essential best practices
- **"C++ Primer" by Stanley Lippman** - Comprehensive introduction

### Advanced
- **"C++ Concurrency in Action" by Anthony Williams** - Threading and async
- **"Effective C++" by Scott Meyers** - Timeless C++ wisdom
- **"The C++ Programming Language" by Bjarne Stroustrup** - The definitive reference

## Online Resources

### Reference
- [cppreference.com](https://en.cppreference.com/) - Comprehensive API reference
- [C++ Core Guidelines](https://isocpp.github.io/CppCoreGuidelines/) - Best practices

### Tutorials & Guides
- [LearnCpp.com](https://www.learncpp.com/) - Step-by-step tutorials
- [Compiler Explorer](https://godbolt.org/) - See generated assembly
- [C++ Weekly](https://www.youtube.com/c/lefticus1) - YouTube series by Jason Turner

### Communities
- [r/cpp](https://reddit.com/r/cpp) - Reddit community
- [C++ Slack](https://cpplang.slack.com/) - Real-time discussions
- [Stack Overflow](https://stackoverflow.com/questions/tagged/c%2b%2b) - Q&A

## Project-Specific Resources

### Project 1: Networking
- Beej's Guide to Network Programming
- POSIX socket documentation
- TCP/IP Illustrated (book)

### Project 2: Concurrency
- C++ Concurrency in Action (book)
- Anthony Williams' blog
- cppreference.com threading section

### Project 3: RAII & Smart Pointers
- Effective Modern C++ (chapters on smart pointers)
- C++ Core Guidelines on resource management
- Herb Sutter's blog posts

### Project 4: Templates
- C++ Templates: The Complete Guide (book)
- Template metaprogramming resources
- Concept documentation (C++20)

### Project 5: Functional Programming
- Lambda expressions documentation
- std::function and std::bind references
- Event-driven architecture patterns

### Project 6: WebRTC
- [WebRTC documentation](https://webrtc.org/)
- libdatachannel documentation
- NAT traversal and ICE guides

## Tools & Utilities

### Development
- **clang-format** - Code formatting
- **clang-tidy** - Static analysis
- **cppcheck** - Additional static analysis
- **Compiler Explorer** - Inspect generated code

### Debugging
- **gdb/lldb** - Command-line debuggers
- **valgrind** - Memory error detection
- **AddressSanitizer** - Runtime memory error detection
- **ThreadSanitizer** - Race condition detection

### Performance
- **perf** - Linux performance analyzer
- **Instruments** - macOS profiling tool
- **Google Benchmark** - Microbenchmarking library

## Standards & Specifications

- [ISO C++ Standard](https://isocpp.org/std/the-standard)
- C++17 features overview
- C++20 features overview
- C++23 upcoming features
```

**11. `docs/reflections/README.md`**
```markdown
# Project Reflections

This directory contains detailed reflections written after completing each project.

## Purpose

Document:
- Key learnings and insights
- Challenges faced and how they were overcome
- Design decisions and trade-offs
- What you'd do differently next time
- Time spent on different aspects

## Template

Use this template for each reflection:

```markdown
# Project N: [Project Name]

**Completed:** [Date]  
**Duration:** [Weeks/Days]  
**Total Hours:** ~[Estimate]

## Overview
Brief summary of what you built and key features implemented.

## What I Learned
- Concept 1: Explanation
- Concept 2: Explanation
- ...

## Challenges & Solutions
### Challenge 1: [Title]
**Problem:** Description
**Solution:** How you solved it
**Lesson:** What you learned

### Challenge 2: [Title]
...

## Design Decisions
- Decision 1 and rationale
- Decision 2 and rationale

## Code Quality
- Tests written: N
- Test coverage: ~X%
- Static analysis: Clean / Minor issues
- Code review notes: [If you had someone review it]

## Performance Notes
[If applicable - benchmarks, profiling results, optimizations]

## What I'd Do Differently
- Point 1
- Point 2

## Favorite Code Snippet
```cpp
// Your proudest piece of code with explanation
```

## Resources Used
- Resource 1
- Resource 2

## Next Steps
What to focus on in the next project based on this experience.
```
```

### GitHub Actions

**12. `.github/workflows/ci.yml`**
```yaml
name: CI

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main, develop ]

jobs:
  build:
    strategy:
      matrix:
        os: [ubuntu-latest, macos-latest, windows-latest]
        build_type: [Debug, Release]

    runs-on: ${{ matrix.os }}

    steps:
    - uses: actions/checkout@v3

    - name: Configure CMake
      run: cmake -B build -DCMAKE_BUILD_TYPE=${{ matrix.build_type }}

    - name: Build
      run: cmake --build build --config ${{ matrix.build_type }}

    - name: Test
      run: |
        cd build
        ctest -C ${{ matrix.build_type }} --output-on-failure

  sanitizers:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3

    - name: Install Dependencies
      run: sudo apt-get update && sudo apt-get install -y clang

    - name: Configure with Sanitizers
      run: |
        cmake -B build \
          -DCMAKE_CXX_COMPILER=clang++ \
          -DCMAKE_BUILD_TYPE=Debug \
          -DENABLE_SANITIZERS=ON

    - name: Build
      run: cmake --build build

    - name: Test with Sanitizers
      run: |
        cd build
        ctest --output-on-failure

  format-check:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3

    - name: Install clang-format
      run: sudo apt-get update && sudo apt-get install -y clang-format

    - name: Check formatting
      run: |
        find . -name "*.cpp" -o -name "*.hpp" | xargs clang-format --dry-run --Werror
```

**13. `.github/ISSUE_TEMPLATE/bug_report.md`**
```markdown
---
name: Bug report
about: Create a report for a bug in the projects
title: '[BUG] '
labels: bug
assignees: ''
---

## Bug Description
A clear and concise description of the bug.

## Project
Which project is affected?
- [ ] Project 1: Ping-Pong Server
- [ ] Project 2: Chat Server
- [ ] Project 3: File I/O
- [ ] Project 4: Template Library
- [ ] Project 5: Event System
- [ ] Project 6: WebRTC CLI

## To Reproduce
Steps to reproduce the behavior:
1. ...
2. ...
3. ...

## Expected Behavior
What you expected to happen.

## Actual Behavior
What actually happened.

## Environment
- OS: [e.g., Ubuntu 22.04]
- Compiler: [e.g., GCC 11.3]
- CMake version: [e.g., 3.22]
- Build type: [Debug/Release]

## Additional Context
Add any other context, error messages, or screenshots.
```

### Scripts

**14. `scripts/setup_dev_env.sh`**
```bash
#!/bin/bash
# Development environment setup script

set -e

echo "=== C++ Forge Development Environment Setup ==="

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
```

**15. `scripts/run_all_tests.sh`**
```bash
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
```

**16. `scripts/format_all.sh`**
```bash
#!/bin/bash
# Format all C++ source files

set -e

echo "=== Formatting all C++ files ==="

find . -name "*.cpp" -o -name "*.hpp" -o -name "*.h" | \
    grep -v "build/" | \
    xargs clang-format -i

echo "=== Formatting complete ==="
```

**17. `scripts/lint_all.sh`**
```bash
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
```

### Per-Project Files

For each project directory (`project1-ping-pong`, `project2-chat-server`, etc.), create:

**18. `project*/CMakeLists.txt`** (Template - adapt for each project)
```cmake
cmake_minimum_required(VERSION 3.20)

# Project name - adjust for each project
project(Project1PingPong)

# Source files will be added here
# add_executable(${PROJECT_NAME} src/main.cpp)

# Include directories
target_include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

# Link shared utilities if built
if(TARGET SharedUtils)
    target_link_libraries(${PROJECT_NAME} PRIVATE SharedUtils)
endif()

# Platform-specific libraries
if(WIN32)
    target_link_libraries(${PROJECT_NAME} PRIVATE ws2_32)
endif()

# Tests
if(BUILD_TESTS)
    add_subdirectory(tests)
endif()
```

**19. `project*/docs/README.md`** (Template)
```markdown
# Project [N]: [Project Name]

**Status:** Not Started  
**Duration:** [Estimated]

## Goal
[Project goal from roadmap]

## Success Criteria
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] ...

## Concepts Practiced
- Concept 1
- Concept 2
- ...

## Features Implemented
*Will be filled in during development*

## Build Instructions

```bash
cd build
cmake ..
cmake --build . --target Project[N][Name]
./project[N]-[name]/Project[N][Name]
```

## Usage
*Documentation will be added as features are implemented*

## Testing

```bash
cd build
ctest -R Project[N]
```

## Design Notes
*Architectural decisions and design rationale*

## Known Issues
*Track issues discovered during development*
```

**20. `project*/tests/CMakeLists.txt`** (Template)
```cmake
# Test files will be added here
# Each test file should be added as a separate executable

# Example:
# add_executable(test_server test_server.cpp)
# target_link_libraries(test_server PRIVATE ${PROJECT_NAME}_lib)
# add_test(NAME test_server COMMAND test_server)
```

**21. `shared/CMakeLists.txt`**
```cmake
cmake_minimum_required(VERSION 3.20)

project(SharedUtils)

# Source files will be added here as needed
# add_library(${PROJECT_NAME} STATIC
#     src/logger.cpp
# )

# target_include_directories(${PROJECT_NAME} PUBLIC
#     ${CMAKE_CURRENT_SOURCE_DIR}/include
# )
```

---

## Creation Instructions

1. Create all directories in the structure shown above
2. Create all files with the content provided
3. Make shell scripts executable: `chmod +x scripts/*.sh`
4. Initialize git repository: `git init`
5. Make initial commit with the scaffold

Do NOT create any `.cpp` or `.hpp` files in the src/ or include/ directories - those will be created during development.

The result should be a complete, buildable (though empty) project structure ready for implementation.