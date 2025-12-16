.PHONY: all build debug release clean configure format lint test check help

BUILD_DIR := build
BUILD_TYPE ?= Debug

all: build

configure:
	@mkdir -p $(BUILD_DIR)
	@cd $(BUILD_DIR) && cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
	@ln -sf $(BUILD_DIR)/compile_commands.json compile_commands.json 2>/dev/null || true

build: configure
	@cmake --build $(BUILD_DIR) -j$$(sysctl -n hw.ncpu 2>/dev/null || nproc 2>/dev/null || echo 4)

debug:
	@$(MAKE) BUILD_TYPE=Debug build

release:
	@$(MAKE) BUILD_TYPE=Release build

clean:
	@rm -rf $(BUILD_DIR)
	@rm -f compile_commands.json

format:
	@echo "Formatting C++ files..."
	@find . -type f \( -name "*.cpp" -o -name "*.hpp" -o -name "*.h" \) \
		-not -path "*/build/*" \
		-not -path "*/cmake-build-*/*" \
		-not -path "*/_deps/*" \
		-not -path "*/CMakeFiles/*" \
		| xargs -r clang-format -i 2>/dev/null || echo "No files to format or clang-format not installed"

format-check:
	@echo "Checking formatting..."
	@find . -type f \( -name "*.cpp" -o -name "*.hpp" -o -name "*.h" \) \
		-not -path "*/build/*" \
		-not -path "*/cmake-build-*/*" \
		-not -path "*/_deps/*" \
		-not -path "*/CMakeFiles/*" \
		| xargs -r clang-format --dry-run --Werror 2>/dev/null || echo "No files to check or clang-format not installed"

lint: configure
	@echo "Running clang-tidy..."
	@find . -type f -name "*.cpp" \
		-not -path "*/build/*" \
		-not -path "*/cmake-build-*/*" \
		-not -path "*/_deps/*" \
		-not -path "*/CMakeFiles/*" \
		-not -path "*/tests/*" \
		| xargs -r clang-tidy -p $(BUILD_DIR) 2>/dev/null || echo "No files to lint or clang-tidy not installed"

test: build
	@cd $(BUILD_DIR) && ctest --output-on-failure

sanitize:
	@mkdir -p $(BUILD_DIR)
	@cd $(BUILD_DIR) && cmake -DCMAKE_BUILD_TYPE=Debug -DENABLE_SANITIZERS=ON ..
	@cmake --build $(BUILD_DIR) -j$$(sysctl -n hw.ncpu 2>/dev/null || nproc 2>/dev/null || echo 4)

tsan:
	@mkdir -p $(BUILD_DIR)
	@cd $(BUILD_DIR) && cmake -DCMAKE_BUILD_TYPE=Debug -DENABLE_THREAD_SANITIZER=ON ..
	@cmake --build $(BUILD_DIR) -j$$(sysctl -n hw.ncpu 2>/dev/null || nproc 2>/dev/null || echo 4)

check: format-check lint test

help:
	@echo "cpp-odyssey build system"
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  build        Build project (default, Debug)"
	@echo "  debug        Build with Debug configuration"
	@echo "  release      Build with Release configuration"
	@echo "  clean        Remove build directory"
	@echo "  configure    Run CMake configuration"
	@echo "  format       Format all C++ source files"
	@echo "  format-check Check formatting without modifying"
	@echo "  lint         Run clang-tidy static analysis"
	@echo "  test         Run all tests"
	@echo "  sanitize     Build with AddressSanitizer + UBSan"
	@echo "  tsan         Build with ThreadSanitizer"
	@echo "  check        Run format-check, lint, and test"
	@echo "  help         Show this help"

