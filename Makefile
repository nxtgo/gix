APP_NAME := gix
BUILD_DIR := build
PKG := ./cmd/$(APP_NAME)
VERSION := $(shell ./scripts/version.sh)
LDFLAGS := -X 'main.Version=$(VERSION)'

# default target
.PHONY: all
all: build

## build gix for the host os
.PHONY: build
build:
	@echo "building $(APP_NAME) ($(VERSION))..."
	@mkdir -p $(BUILD_DIR)
	@go build -ldflags "$(LDFLAGS)" -o $(BUILD_DIR)/$(APP_NAME) $(PKG)
	@echo "done: $(BUILD_DIR)/$(APP_NAME)"

## cross-compile for multiple os/arch targets
.PHONY: build-all
build-all:
	@echo "building $(APP_NAME) for all platforms..."
	@mkdir -p $(BUILD_DIR)
	GOOS=linux   GOARCH=amd64 go build -ldflags "$(LDFLAGS)" -o $(BUILD_DIR)/$(APP_NAME)-linux-amd64 $(PKG)
	GOOS=linux   GOARCH=arm64 go build -ldflags "$(LDFLAGS)" -o $(BUILD_DIR)/$(APP_NAME)-linux-arm64 $(PKG)
	GOOS=darwin  GOARCH=amd64 go build -ldflags "$(LDFLAGS)" -o $(BUILD_DIR)/$(APP_NAME)-darwin-amd64 $(PKG)
	GOOS=darwin  GOARCH=arm64 go build -ldflags "$(LDFLAGS)" -o $(BUILD_DIR)/$(APP_NAME)-darwin-arm64 $(PKG)
	GOOS=windows GOARCH=amd64 go build -ldflags "$(LDFLAGS)" -o $(BUILD_DIR)/$(APP_NAME)-windows-amd64.exe $(PKG)
	@echo "all binaries built in $(BUILD_DIR)/"

## run the app locally
.PHONY: run
run:
	@echo "running $(APP_NAME)..."
	@go run $(PKG)

## run tests
.PHONY: test
test:
	@echo "running tests..."
	@go test ./... -cover

## clean build artifacts
.PHONY: clean
clean:
	@echo "cleaning..."
	@rm -rf $(BUILD_DIR)
	@go clean
	@echo "clean complete."

## format code (goimports/go fmt)
.PHONY: fmt
fmt:
	@echo "formatting code..."
	@go fmt ./...

## check for linting issues (optional)
.PHONY: lint
lint:
	@echo "linting..."
	@go vet ./...

