# Variables
APP_NAME = gencode
GO_FILES = $(wildcard *.go)
GO_CMD = go
GO_BUILD = $(GO_CMD) build
GO_TEST = $(GO_CMD) test
GO_BIN = $(shell go env | grep PATH | cut -d'=' -f2)/bin

all: build

build: $(APP_NAME)

$(APP_NAME): $(GO_FILES)
	$(GO_BUILD) -o $(APP_NAME) $(GO_FILES)

test:
	$(GO_TEST) -v ./... -cover

install: $(APP_NAME)
	@cp $(APP_NAME) $(GO_BIN)
	@echo Successfully installed to $(GO_BIN)

clean:
	@rm -rf $(APP_NAME)

.PHONY: all build test
