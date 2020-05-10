#!/bin/sh

# metadata
today="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
filename="$(basename "$1" .md)"
title="$(grep title "$1" | cut -d ' ' -f 2-)"
edited="$(awk '/edited:/ {print $2; exit}' "$1")"
summary="$(pandoc "$1" -t plain | sed -e '/^$/,$d')"
url="https://hypomnema.net/$filename"
content="$(sed -n '/<main>/,/<\/main>/{s/&/\&amp;/g;s/</\&lt;/g;s/>/\&gt;/g;p;};' docs/"$filename".html)"

mkdir -p .tmp

# Atom entry
cat > .tmp/"$edited"-"$title"-entry.xml << EOF
  <entry>
    <title>$title</title>
    <link href='$url'/>
    <id>$url</id>
    <updated>$today</updated>
    <summary>$summary</summary>
    <content type='text/html'>
      $content
    </content>
  </entry>
EOF

