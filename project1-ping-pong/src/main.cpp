#include <iostream>

#include "common/utils.hpp"
#include "SomeFile.h"

int main() {
    std::cout << common::greet("World") << '\n';
    const auto someChar = GetSomeChar();
    std::cout << someChar << '\n';
    return 0;
}
