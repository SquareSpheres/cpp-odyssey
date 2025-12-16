cmake_minimum_required(VERSION 3.20)
project(CppOdyssey VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

if(MSVC)
    add_compile_options(/W4)
else()
    add_compile_options(-Wall -Wextra -Wpedantic)
endif()

option(BUILD_TESTS "Build tests" ON)
option(BUILD_SHARED "Build shared utilities" ON)
option(ENABLE_SANITIZERS "Enable sanitizers (address, undefined)" OFF)
option(ENABLE_THREAD_SANITIZER "Enable thread sanitizer" OFF)

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

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

if(BUILD_TESTS)
    enable_testing()
    include(CTest)
    
    include(FetchContent)
    FetchContent_Declare(
        Catch2
        GIT_REPOSITORY https://github.com/catchorg/Catch2.git
        GIT_TAG v3.5.0
    )
    FetchContent_MakeAvailable(Catch2)
    list(APPEND CMAKE_MODULE_PATH ${catch2_SOURCE_DIR}/extras)
    include(Catch)
    include(Testing)
endif()

if(BUILD_SHARED)
    add_subdirectory(shared)
endif()

add_subdirectory(project1-ping-pong)
add_subdirectory(project2-chat-server)
add_subdirectory(project3-file-io)
add_subdirectory(project4-template-library)
add_subdirectory(project5-event-system)
add_subdirectory(project6-webrtc-cli)

