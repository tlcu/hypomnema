#!/bin/sh
# metadata
today="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
filename="$(basename "$1" .md)"
title="$(grep title "$1" | cut -d ' ' -f 2-)"
edited="$(awk '/edited:/ {print $2; exit}' "$1")"
summary="$(pandoc "$1" -t plain | sed -e '/^$/,$d')"
url="https://hypomnema.net/$filename"

mkdir -p .tmp

# Atom entry
cat > .tmp/"$edited"-"$title"-entry.xml << EOF
  <entry>
    <title>$title</title>
    <link href='$url'/>
    <id>$url</id>
    <updated>$today</updated>
    <summary>$summary</summary>
    <content type='html' src='$url'></content>
  </entry>
EOF

