build: test
	./build.sh
test:
	shellcheck build.sh
dev: build
	serve docs &
	fd . | entr -s './build.sh'
