# Project 1: TCP/UDP Ping-Pong Server

**Status:** Not Started  
**Duration:** [Estimated]

## Goal
Build a simple TCP and UDP server that echoes messages back to clients, implementing RAII patterns for socket management.

## Success Criteria
- [ ] TCP echo server functional
- [ ] UDP packet counter working
- [ ] RAII socket wrapper implemented
- [ ] Client disconnects handled gracefully
- [ ] Cross-platform socket abstraction

## Concepts Practiced
- Socket programming (POSIX/Winsock)
- RAII (Resource Acquisition Is Initialization)
- Error handling
- Basic networking protocols

## Features Implemented
*Will be filled in during development*

## Build Instructions

```bash
cd build
cmake ..
cmake --build . --target Project1PingPong
./project1-ping-pong/Project1PingPong
```

## Usage
*Documentation will be added as features are implemented*

## Testing

```bash
cd build
ctest -R Project1
```

## Design Notes
*Architectural decisions and design rationale*

## Known Issues
*Track issues discovered during development*

