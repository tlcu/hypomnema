#!/bin/sh
# metadata
get_modified() {
  stat -t %Y-%m-%d "$1" | cut -d ' ' -f 9 | tr -d '"'
}

filename="$(basename "$1" .md)"
title="$(grep title "$1" | cut -d ' ' -f 2-)"
body="$(pandoc "$1" -t plain | paste -sd ' ' -)"
# JSON for search
object="
{
  \"title\": \"$title\",
  \"url\": \"https://www.hypomnema.net/$filename\",
  \"body\": \"$body\"
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
       --metadata   date="$(get_modified "$1")"                             \
       --metadata   sitename=hypomnema                                      \
       --output     docs/"$filename".html
