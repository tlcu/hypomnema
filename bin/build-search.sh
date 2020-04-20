#!/bin/sh

# setup search
cd docs || exit

# remove index from search results
jq '.[] | del(select(.title == "")) // empty' ../static/index.json | jq -s > index.json
tinysearch --optimize index.json

