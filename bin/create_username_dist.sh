#!/bin/bash
HERE=(pwd)
DIR="$1"
FILE="username_dist"
cd "$DIR"
echo > TEMP.txt #create temp file
grep -rIhEo '\b[a-z][a-zA-Z0-9_-]*' . | sort -u | uniq -c >> TEMP.txt #Grabs text from all files in directory that match the pattern, then sorts it and puts the names into their own lines, then counts the times each name is found 
awk 'NF {print "data.addRow([\047" $2 ", " $1"\047])"}' TEMP.txt >> TEMP1.txt #Takes the earlier output and creates a new line using the variables defined in awk and puts the output into a file.
cd ..
./bin/wrap_contents.sh "$DIR"/TEMP1.txt html_components/"$FILE" "$FILE".html #Wrap file contents in html and create html file
mv "$FILE".html "$DIR" #Moves the created html file to the given directory
rm "$DIR"/TEMP.txt #Remove temp file
rm "$DIR"/TEMP1.txt
