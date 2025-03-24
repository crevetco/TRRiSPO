# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17 -Iinclude

# Source files
SRCS = main.cpp

# Object files
OBJS = $(SRCS:.cpp=.o)

# Output directories
BUILD_DIR = ../usr/bin
INSTALL_DIR = /usr/bin

# Executable name
TARGET = my_program

# Test executable
TEST_TARGET = test_runner

# Main targets
all: prepare $(BUILD_DIR)/$(TARGET)

prepare:
	mkdir -p $(BUILD_DIR)

# Main executable
$(BUILD_DIR)/$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean
clean:
	rm -f $(OBJS) $(BUILD_DIR)/$(TARGET) $(BUILD_DIR)/$(TEST_TARGET)

# Install
install: all
	install -D -m 0755 $(BUILD_DIR)/$(TARGET) $(DESTDIR)$(INSTALL_DIR)/$(TARGET)

# Test build
test: prepare $(BUILD_DIR)/$(TEST_TARGET)
	$(BUILD_DIR)/$(TEST_TARGET)

# Test executable
TEST_SRCS = tests/test_main.cpp
TEST_OBJS = $(TEST_SRCS:.cpp=.o)

$(BUILD_DIR)/$(TEST_TARGET): $(TEST_OBJS)
	$(CXX) $(CXXFLAGS) -lgtest -lgtest_main -pthread -o $@ $^

.PHONY: all prepare clean install test