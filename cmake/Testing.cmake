function(add_catch2_test)
    set(options "")
    set(oneValueArgs NAME)
    set(multiValueArgs SOURCES LIBRARIES)
    cmake_parse_arguments(TEST "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_executable(${TEST_NAME} ${TEST_SOURCES})
    target_link_libraries(${TEST_NAME} PRIVATE Catch2::Catch2WithMain ${TEST_LIBRARIES})
    catch_discover_tests(${TEST_NAME})
endfunction()

