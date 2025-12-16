#include <catch2/catch_test_macros.hpp>

#include "common/utils.hpp"

TEST_CASE("greet returns formatted greeting") {
    REQUIRE(common::greet("World") == "Hello, World!");
    REQUIRE(common::greet("Test") == "Hello, Test!");
}

TEST_CASE("1+1 == 2") {
    REQUIRE(1 + 1 == 2);
}

TEST_CASE("1+1+3 == 5") {
    REQUIRE(1 + 1 + 3 == 5);
}
