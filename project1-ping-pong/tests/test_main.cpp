#include <catch2/catch_test_macros.hpp>

#include "common/utils.hpp"
#include "SomeFile.h"

TEST_CASE("greet returns formatted greeting") {
    REQUIRE(common::greet("World") == "Hello, World!");
    REQUIRE(common::greet("Test") == "Hello, Test!");
}

TEST_CASE("GetSomeChar returns a dot") {
    REQUIRE(GetSomeChar() == '.');
}
