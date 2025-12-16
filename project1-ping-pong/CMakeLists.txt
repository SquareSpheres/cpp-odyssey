cmake_minimum_required(VERSION 3.20)

project(Project1PingPong)

add_executable(${PROJECT_NAME} src/main.cpp
        src/SomeFile.cpp
        src/SomeFile.h)

target_include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

if(TARGET SharedUtils)
    target_link_libraries(${PROJECT_NAME} PRIVATE SharedUtils)
endif()

if(WIN32)
    target_link_libraries(${PROJECT_NAME} PRIVATE ws2_32)
endif()

if(BUILD_TESTS)
    add_subdirectory(tests)
endif()
