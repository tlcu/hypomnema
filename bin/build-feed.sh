#!/bin/sh

# metadata
today="$(date -u +'%Y-%m-%dT%H:%M:%SZ')"

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
