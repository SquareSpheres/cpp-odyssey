# Project 2: Multi-threaded Chat Server

**Status:** Not Started  
**Duration:** [Estimated]

## Goal
Build a chat server that handles multiple concurrent clients using threading and synchronization primitives.

## Success Criteria
- [ ] Thread-per-client model implemented
- [ ] Thread-safe message broadcasting
- [ ] Private messaging between clients
- [ ] Graceful shutdown handling
- [ ] No race conditions or deadlocks

## Concepts Practiced
- std::thread and thread management
- Mutexes and locks (std::mutex, std::lock_guard)
- Condition variables
- Thread-safe data structures
- Concurrent programming patterns

## Features Implemented
*Will be filled in during development*

## Build Instructions

```bash
cd build
cmake ..
cmake --build . --target Project2ChatServer
./project2-chat-server/Project2ChatServer
```

## Usage
*Documentation will be added as features are implemented*

## Testing

```bash
cd build
ctest -R Project2
```

## Design Notes
*Architectural decisions and design rationale*

## Known Issues
*Track issues discovered during development*

