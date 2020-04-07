build: test
	./build.sh
test:
	shellcheck build.sh
dev: build
	serve out &
	fd . | entr -s './build.sh'
