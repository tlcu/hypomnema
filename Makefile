test:
	shellcheck bin/*.sh
build: test
	./bin/build-all.sh
