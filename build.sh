#!/bin/sh

sitename='Hypomnema'
cd src || exit
for draft in *.md
do
  name="$(basename -s .md "$draft")"
  pandoc \
    --css        style.css \
    --output     ../out/"$name".html \
    --self-contained \
    --standalone "$draft" \
    --template   template.html \
    --metadata sitename="$sitename"
done
