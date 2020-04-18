#!/bin/sh
# build-one script is a hack to prevent find -exec issues
find drafts -name '*.md' -exec ./bin/build-one.sh {} \;
find static -mindepth 1 -exec cp {} docs \;
# setup search
cd docs || exit
# remove index from search results
jq '.[] | del(select(.title == "")) // empty' ../static/index.json | jq -s > index.json
tinysearch --optimize index.json
