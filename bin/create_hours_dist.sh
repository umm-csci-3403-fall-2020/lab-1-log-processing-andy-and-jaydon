#!/bin/bash
DIR="$1"
FILE="hours_dist"
(cd "$DIR" || exit
#create temp file
echo >> TEMP.txt 

# shellcheck disable=SC2016
#Grabs text from all files in directory that match the pattern, then sorts it and puts the names into their own lines, then counts the times each name is found and puts it in a file
find . -name "failed_login_data.txt" -print0 | xargs -0 awk '{ print $3 }' | sort | uniq -c >> TEMP.txt

#Takes the earlier output and creates a new line using the variables defined in awk and puts the output into a file.
awk 'NF {print "data.addRow([\047" $2"\047, " $1"]);"}' TEMP.txt >> TEMP1.txt).

#Wrap temp file contents in html and create html file
./bin/wrap_contents.sh "$DIR"/TEMP1.txt html_components/"$FILE" "$FILE".html

#Moves the created html file to the given directory and remove temp files
mv "$FILE".html "$DIR"
rm "$DIR"/TEMP.txt "$DIR"/TEMP1.txt
