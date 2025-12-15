# Modern C++ Hobby Project Roadmap

A 6-project roadmap to progressively learn modern C++ concepts, from basic networking to a complete CLI WebRTC app. Each project focuses on specific C++ skills, ownership patterns, RAII, and threading, culminating in a real-world networking application.

## **Learning Rules**

- **No AI/LLM assistance** is allowed for writing code or generating solutions
- **Very basic tab completion** or code snippets in the IDE are allowed
- **AI can be used** for code review, explanations, or as a "Google" to look up syntax and concepts
- **The goal** is to learn by thinking and solving problems directly

---

## **Project 1 — TCP/UDP Ping-Pong Server**
**Duration:** 1–2 weeks

### Goal
Build a server that can accept messages from clients and reply correctly, handling multiple clients sequentially. Learn basic networking and RAII.

### Success Criteria
- Server receives a message from a client and replies with the same message prefixed with a timestamp
- UDP version counts packets received from each client and reports statistics
- Handles client disconnects gracefully without crashing
- Resources (sockets, buffers) are cleaned up automatically via RAII

### Concepts Practiced
- Sockets (TCP/UDP)
- Buffers with `std::vector` or `std::string`
- RAII for socket lifetime management
- Error handling (exceptions or return codes)

### Potential Features / Extensions
- Echo server that prefixes responses with timestamps
- Logging connection attempts to a file
- Timeout handling for idle clients
- Statistics tracking (bytes transferred, connection duration)
- Configurable port and buffer sizes
- Simple protocol with message framing (length prefix)

### Technical Challenges
- Proper cleanup when clients disconnect abruptly
- Safe handling of abrupt terminations
- Preventing buffer overruns
- Handling partial reads and writes correctly
- Graceful server shutdown without resource leaks

### Learning Resources to Explore
- POSIX socket API or Boost.Asio basics
- RAII patterns for system resources
- Exception safety guarantees

---

## **Project 2 — Multi-threaded CLI Chat Server**
**Duration:** 2–3 weeks

### Goal
Build a concurrent chat server capable of handling multiple clients simultaneously. Introduce threads and concurrent data handling.

### Success Criteria
- Each client runs in its own thread and can send messages to the server
- Server broadcasts messages to all connected clients
- Clients can send private messages using unique identifiers
- Server maintains thread-safe access to shared resources using mutexes
- Server shuts down cleanly without leaving threads dangling

### Concepts Practiced
- `std::thread` and RAII wrappers (`std::jthread` in C++20)
- `std::mutex` and `std::lock_guard` / `std::unique_lock`
- Efficient message passing via const references or moves
- Avoiding race conditions and deadlocks
- Thread synchronization primitives

### Potential Features / Extensions
- Unique usernames or IDs for clients
- Basic commands: `/nick`, `/quit`, `/list`, `/whisper`
- Simple text filtering or moderation
- Logging messages with timestamps to file
- Client reconnection handling
- Chat history (last N messages)
- Room/channel support for multiple chat groups
- Presence notifications (user joined/left)

### Technical Challenges
- Clean thread termination on shutdown (using flags or condition variables)
- Avoiding deadlocks with multiple mutexes (lock ordering, `std::scoped_lock`)
- Efficient message queue management (consider lock-free queues)
- Handling slow clients without blocking others
- Managing client state safely across threads

### Learning Resources to Explore
- C++ concurrency patterns
- Thread-safe queue implementations
- Condition variables for signaling
- Reader-writer locks for optimized access patterns

---

## **Project 3 — File I/O and RAII**
**Duration:** 2 weeks

### Goal
Build a CLI tool that reads, processes, and writes files safely and efficiently. Learn deterministic resource management and smart pointers.

### Success Criteria
- Reads and writes files using RAII-wrapped file handles
- Processes large files in chunks without high memory usage
- Supports simple transformations (uppercase conversion, encryption, compression)
- Proper cleanup occurs if an exception occurs mid-operation
- Memory-efficient streaming for files larger than available RAM

### Concepts Practiced
- RAII for file handles (custom wrappers or `std::fstream`)
- Smart pointers (`std::unique_ptr`, `std::shared_ptr`) for temporary buffers
- Move semantics for large data transfers
- Exception safety in file operations (basic, strong, no-throw guarantees)
- Resource management patterns

### Potential Features / Extensions
- Streaming files in chunks with configurable buffer sizes
- Transform file content (uppercase, compress with zlib, simple XOR encryption)
- Compare files line-by-line and show diffs
- Undo functionality via temporary snapshots or rollback
- Progress reporting for large file operations
- Memory-mapped file I/O for performance comparison
- Batch processing of multiple files
- File format validation and sanitization

### Technical Challenges
- Efficient buffer reuse without memory fragmentation
- Handling partial reads/writes safely (short reads, interruptions)
- Cleanup of temporary resources (temp files, buffers)
- Exception safety with multiple resource types
- Testing rollback mechanisms
- Handling file permissions and access errors

### Learning Resources to Explore
- Exception safety levels and RAII patterns
- Custom deleters for smart pointers
- Move semantics and perfect forwarding
- RAII for multi-resource scenarios

---

## **Project 4 — Template-based Utility Library**
**Duration:** 2–3 weeks

### Goal
Create a small library of reusable generic utilities. Learn templates, generic programming, and type safety.

### Success Criteria
- Implements function templates for sorting, filtering, and mapping over generic containers
- Supports serialization/deserialization for multiple types
- Provides type-safe wrappers using `std::optional` or `std::variant`
- Functions and classes can operate on multiple data types without duplication
- Library compiles with clear error messages for misuse

### Concepts Practiced
- Function and class templates
- Template specialization and SFINAE
- `constexpr` constants and compile-time evaluation
- Generic algorithms for reusability
- `std::optional` or `std::variant` for flexible return types
- Concepts (C++20) for constraining templates

### Potential Features / Extensions
- Sorting, filtering, and mapping functions for generic containers
- Range-based transformations (pipeline-style operations)
- Serialization/deserialization of objects to text or binary formats
- Logging or configuration parsing utilities with type safety
- Type-safe wrappers for units (meters, seconds, currency)
- Result type for error handling (`Result<T, Error>`)
- Generic caching or memoization utilities
- Compile-time string processing

### Technical Challenges
- Making templates readable and maintainable (good naming, documentation)
- Avoiding unnecessary copies in generic code (perfect forwarding)
- Ensuring exception safety in templates
- Providing clear compiler error messages
- Balancing flexibility with type safety
- Template metaprogramming for compile-time optimization

### Learning Resources to Explore
- Template metaprogramming basics
- SFINAE and `std::enable_if`
- C++20 Concepts for cleaner constraints
- Perfect forwarding patterns
- Expression templates for performance

---

## **Project 5 — Simple Event-driven CLI App**
**Duration:** 3 weeks

### Goal
Build a small event-driven CLI tool or game loop using callbacks and lambdas. Learn callbacks, lambdas, and functional-style design.

### Success Criteria
- Implements an event system where actions trigger handlers
- Supports scheduling of tasks with delays or conditions
- Tasks and events are handled safely without dangling references or race conditions
- Optional: integrates simple asynchronous operations in separate threads
- Clean shutdown releases all pending events

### Concepts Practiced
- Lambda functions and captures (by value, by reference)
- `std::function` for type-erased callbacks
- Event loops or task queues
- Ownership transfer via move semantics
- Optional multi-threading for async tasks
- Lifetime management of callback dependencies

### Potential Features / Extensions
- CLI task scheduler with delayed tasks (run after N seconds)
- Text-based game loop (turn-based or grid-based game)
- Custom logging system triggered by events (severity levels, filters)
- Event-driven command interpreter with plugin architecture
- Periodic tasks (cron-like scheduling)
- Event priorities and ordering
- Cancellable events
- Event composition (chaining, conditional execution)

### Technical Challenges
- Ensuring callbacks do not outlive referenced objects (weak pointers, lifetime tracking)
- Handling exceptions inside event callbacks (propagation vs. local handling)
- Coordinating asynchronous tasks without data races
- Preventing memory leaks with circular callback references
- Implementing efficient event dispatch
- Testing event-driven code (time mocking, event injection)

### Learning Resources to Explore
- Observer pattern and event systems
- Lambda capture semantics
- `std::bind` and `std::function` internals
- Async task scheduling patterns
- State machines for complex event handling

---

## **Project 6 — Complete CLI WebRTC App**
**Duration:** 4–6 weeks

### Goal
Build a fully working CLI WebRTC application supporting peer-to-peer messaging and file transfer. Apply all prior knowledge to a real-world networking project.

### Success Criteria
- Peer-to-peer signaling and connection establishment work reliably
- Data channels can send and receive text messages and files
- Optional: audio streaming between peers
- Thread-safe handling of callbacks and asynchronous events
- RAII and smart pointers correctly manage all network objects and buffers
- Large messages and files are transferred efficiently using move semantics
- Handles network interruptions gracefully and recovers connections
- Clean shutdown with no resource leaks or dangling threads

### Concepts Practiced
- Integration with WebRTC library (libwebrtc, libdatachannel, or similar)
- Peer-to-peer signaling and session management (SDP, ICE)
- Data channels for messages and files
- Thread-safe callbacks and asynchronous events
- RAII and smart pointer ownership patterns
- Move semantics for large buffers and zero-copy transfers
- Advanced error handling and recovery

### Potential Features / Extensions
- CLI chat between peers with multiple simultaneous connections
- File transfer with chunked buffers and progress reporting
- Optional audio streaming via PortAudio or similar library
- Comprehensive logging with configurable verbosity
- Configuration file support (STUN/TURN servers, codec preferences)
- NAT traversal handling (STUN, TURN)
- Connection state management (connecting, connected, disconnected)
- Automatic reconnection on network interruptions
- Peer discovery on local network
- Simple UI with ncurses for better visualization
- Performance metrics (bandwidth, latency, packet loss)

### Technical Challenges
- Managing lifetimes of peers, channels, and messages across callbacks
- Handling network interruptions gracefully (reconnection logic)
- Coordinating multiple asynchronous operations (signaling, media, data)
- Performance tuning for large files or multiple connections
- Integrating with C WebRTC APIs using RAII wrappers
- Testing peer-to-peer connections (network simulation)
- Debugging timing-sensitive issues
- Memory management with callback-heavy code
- Handling WebRTC state machine complexity

### Learning Resources to Explore
- WebRTC fundamentals (signaling, ICE, DTLS, SRTP)
- NAT traversal techniques
- Audio/video codec basics
- Network programming patterns for P2P
- Integration patterns for C libraries in C++

### Suggested Implementation Phases
1. **Phase 1:** Basic signaling and connection establishment
2. **Phase 2:** Data channel text messaging
3. **Phase 3:** File transfer with chunking and progress
4. **Phase 4:** Multi-peer support and connection management
5. **Phase 5:** Audio streaming (optional)
6. **Phase 6:** Polish, error handling, and performance optimization

---

## **Cross-cutting C++ Skills**

| Skill | Projects Practiced | Mastery Level |
|-------|-----------------|---------------|
| RAII / deterministic cleanup | 1, 3, 6 | Beginner → Advanced |
| Smart pointers & ownership | 3, 4, 6 | Intermediate → Advanced |
| Move semantics | 3, 4, 5, 6 | Beginner → Expert |
| Const correctness | All projects | Consistent practice |
| Templates / generic programming | 4 | Intermediate → Advanced |
| Threads / concurrency | 2, 5, 6 | Beginner → Advanced |
| Callbacks / lambdas | 5, 6 | Intermediate → Advanced |
| Networking fundamentals | 1, 2, 6 | Beginner → Advanced |
| Error handling & exception safety | All projects | Consistent practice |

---

## **General Development Practices**

Throughout all projects, practice these essential habits:

### Code Quality
- Write clear, self-documenting code with meaningful names
- Add comments for complex algorithms, not obvious code
- Use consistent formatting (choose a style guide)
- Keep functions small and focused (single responsibility)

### Testing
- Write tests as you develop (TDD optional but recommended)
- Test edge cases (null, empty, boundary values)
- Test error paths, not just happy paths
- Use sanitizers (AddressSanitizer, ThreadSanitizer, UBSan)

### Debugging
- Learn your debugger thoroughly (gdb, lldb, or IDE debugger)
- Use logging strategically (not excessively)
- Reproduce bugs reliably before fixing
- Keep a development journal of tricky bugs and solutions

### Build System
- Use CMake or similar for project organization
- Enable all reasonable compiler warnings (`-Wall -Wextra -Wpedantic`)
- Use different build types (Debug, Release, RelWithDebInfo)
- Consider static analysis tools (clang-tidy, cppcheck)

### Version Control
- Commit frequently with clear messages
- Create branches for experimental features
- Tag completed milestones
- Review your own diffs before committing

---

## **Recommended C++ Standards**

Start with **C++17** as a baseline, then explore **C++20** features:

### C++17 Features to Use
- Structured bindings
- `std::optional`, `std::variant`, `std::any`
- `if constexpr` for compile-time branching
- Fold expressions
- `std::string_view` for non-owning string references

### C++20 Features to Explore
- Concepts for template constraints
- Ranges library
- Coroutines (for Project 5 or 6)
- `std::span` for array views
- `std::jthread` for automatic thread joining
- Three-way comparison operator (`<=>`)

---

## **Learning Path Summary**

This roadmap provides **progressive mastery** through increasingly complex projects:

1. **Projects 1-2:** Foundation (networking, threads, basic RAII)
2. **Projects 3-4:** Intermediate (resource management, generic programming)
3. **Projects 5-6:** Advanced (event systems, real-world application)

Each project builds on previous skills while introducing new concepts. By the end, you'll have:
- A portfolio of working applications
- Deep understanding of modern C++ idioms
- Confidence to tackle real-world C++ projects
- Strong foundation for further specialization (graphics, embedded, systems programming)

**Estimated Total Time:** 16-23 weeks (4-6 months)

The final WebRTC project serves as a capstone, demonstrating mastery of all prior concepts in a challenging, practical application. Good luck, and remember: **the struggle is where the learning happens**!