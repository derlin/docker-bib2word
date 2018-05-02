#!/bin/bash

if [ -z "$1" ]; then 
    echo "usage: bib2word <file.bib> [other.bib]"
else 
    for file in "$@"
    do
        bib2xml "$file" | xml2wordbib > "$(basename "$file" .bib).xml"
    done
fi