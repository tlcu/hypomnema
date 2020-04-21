.PHONY: pages static test
test:
	shellcheck bin/*.sh
static:
	find static -mindepth 1 -exec cp {} docs \;
pages: test static
	find drafts -name '*.md' -exec ./bin/build-page.sh {} \;
entries: test static
	find drafts/articles -name '*.md' -exec ./bin/build-entry.sh {} \;
feed: entries
	./bin/build-feed.sh
search: test static
	./bin/build-search.sh
all: test static pages feed search
