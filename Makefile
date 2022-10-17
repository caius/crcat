.PHONY: all
all: clean crcat

.PHONY: clean
clean:
	rm -f crcat bin/*

.PHONY: deps
deps:
	shards install

.PHONY: build
build: deps
	shards build

.PHONY: release
release: deps
	shards build --no-debug --release
