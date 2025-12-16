cmake_minimum_required(VERSION 3.20)

project(Project1PingPong)

add_library(pingpong_lib STATIC
    src/SomeFile.cpp
    src/SomeFile.h
)

target_include_directories(pingpong_lib PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/src
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

add_executable(${PROJECT_NAME} src/main.cpp)

target_link_libraries(${PROJECT_NAME} PRIVATE pingpong_lib)

if(TARGET SharedUtils)
    target_link_libraries(pingpong_lib PUBLIC SharedUtils)
    target_link_libraries(${PROJECT_NAME} PRIVATE SharedUtils)
endif()

if(WIN32)
    target_link_libraries(${PROJECT_NAME} PRIVATE ws2_32)
endif()

if(BUILD_TESTS)
    add_subdirectory(tests)
endif()
