# === Makefile for cpp-makegen installation ===

# Compiler and flags
CXX := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -O2

# Directories and files
SRC := src/main.cpp
TARGET := cpp-makegen
PREFIX := /usr/local
BINDIR := $(PREFIX)/bin

# Default target: build
all: $(TARGET)

# Build the binary
$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) -o $@ $<

# Install system-wide
install: $(TARGET)
	@echo "Installing $(TARGET) to $(BINDIR)..."
	@sudo mkdir -p $(BINDIR)
	@sudo cp $(TARGET) $(BINDIR)/
	@sudo chmod 755 $(BINDIR)/$(TARGET)
	@echo "Installation complete. You can now run '$(TARGET)' globally."

# Uninstall the binary
uninstall:
	@echo "Removing $(BINDIR)/$(TARGET)..."
	@sudo rm -f $(BINDIR)/$(TARGET)
	@echo "Uninstallation complete."

# Clean build artifacts
clean:
	rm -f $(TARGET)

.PHONY: all install uninstall clean
