#!/bin/sh
# metadata

filename="$(basename "$1" .md)"
title="$(grep title "$1" | cut -d ' ' -f 2-)"
edited="$(awk '/edited:/ {print $2; exit}' "$1")"
body="$(pandoc "$1" -t plain | paste -sd ' ' -)"
url="https://hypomnema.net/$filename"

# JSON for search
object="
{
  \"title\": \"$title\",
  \"url\": \"$url\",
  \"body\": \"$body\",
  \"edited\": \"$edited\"
}
"

# Stitch together the HTML
cp static/index.json tmp.json
jq ". += [$object]" tmp.json > static/index.json
rm tmp.json

pandoc --standalone "$1"                                                    \
       --template   templates/default.html                                  \
       --css        style.css                                               \
       --metadata   author='Thomas Lee Culverwell'                          \
       --metadata   date="$edited"                                          \
       --metadata   sitename=hypomnema                                      \
       --output     docs/"$filename".html
