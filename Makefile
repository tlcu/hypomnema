test:
	shellcheck build.sh
build: test
	./build.sh
dev: build
	serve docs &
	fd . | entr -s './build.sh'
prod: test
	./build.sh 1
