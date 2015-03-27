JS_FILES=$(shell find js/)

all: build node_modules

build: node_modules $(JS_FILES)
	rm -rf build
	mkdir build
	./node_modules/.bin/babel js \
		--experimental \
		--out-dir build \
		--source-maps

node_modules: package.json
	npm install --loglevel info

.PHONY: clean
clean: remove_build remove_node_modules

.PHONY: remove_build
remove_build:
	rm -rf build

.PHONY: remove_node_modules
remove_node_modules:
	rm -rf node_modules

.PHONY: serve
serve: all
	python -m SimpleHTTPServer 8080

.PHONY: watch
watch: node_modules
	./node_modules/.bin/watchman $(shell pwd) "make"