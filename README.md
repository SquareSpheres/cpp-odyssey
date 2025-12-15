# cpp-odyssey

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
git clone https://github.com/yourusername/cpp-odyssey.git
cd cpp-odyssey

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

