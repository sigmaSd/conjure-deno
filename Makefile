.PHONY: deps sponsors compile test

default: deps sponsors compile test

deps:
	scripts/dep.sh Olical aniseed origin/develop

compile:
	rm -rf lua
	deps/aniseed/scripts/embed.sh aniseed conjure
	ANISEED_EMBED_PREFIX=conjure deps/aniseed/scripts/compile.sh

test:
	rm -rf test/lua
	deps/aniseed/scripts/test.sh
