#pragma once

#include <string>

namespace common {

inline std::string greet(const std::string& name) {
    return "Hello, " + name + "!";
}

}  // namespace common
