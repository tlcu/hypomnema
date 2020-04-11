#!/bin/sh
cd src || exit
cp ../node_modules/unfashionable/minified.css .
cp ./*.jpg* ./*.png* ./*.css* ../docs
for draft in *.md
do
  name="$(basename -s .md "$draft")"
  pandoc \
    --output     ../docs/"$name".html \
    --standalone "$draft" \
    --template   template.html \
    --metadata sitename='Hypomnema'
done
