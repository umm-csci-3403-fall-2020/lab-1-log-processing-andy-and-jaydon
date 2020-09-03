#!/bin/bash
FILE="$1" #Store first argument which is the contents file
WRAP="$2" #Store second argument which is the name of desired header and footer
HTML="$3" #Store third argument which is the resulting file

cat "$WRAP"_header.html "$FILE" "$WRAP"_footer.html >> "$HTML" #Use cat to concatenate files together and then sends to HTML output file
