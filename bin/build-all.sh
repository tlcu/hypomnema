#!/bin/sh
# metadata
today="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

# build-one script is a hack to prevent find -exec issues
find drafts -name '*.md' -exec ./bin/build-one.sh {} \;
find drafts/articles -name '*.md' -exec ./bin/build-feed.sh {} \;
find static -mindepth 1 -exec cp {} docs \;

# Atom feed
cat > docs/feed.atom << EOF
<?xml version='1.0' encoding='utf-8'?>
<feed xmlns='http://www.w3.org/2005/Atom'>
  <title>Hypomnema</title>
  <link href='http://www.hypomnema.net/'/>
  <updated>$today</updated>
  <author>
    <name>Thomas Lee Culverwell</name>
  </author>
  <id>http://hypomnema.net/</id>
  $(cat .tmp/*.xml)
</feed>
EOF

rm -rf .tmp

# setup search
cd docs || exit

# remove index from search results
jq '.[] | del(select(.title == "")) // empty' ../static/index.json | jq -s > index.json
tinysearch --optimize index.json

