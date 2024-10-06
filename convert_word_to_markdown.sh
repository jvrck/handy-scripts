#!/bin/bash

# converts a directory of word documents to markdown documents


for file in *.docx
do
    filename="${file%.*}"
    pandoc -s "$file" --wrap=none --reference-links -t markdown_strict -o "${filename}.md"
    echo "Converted $file to ${filename}.md"
done
