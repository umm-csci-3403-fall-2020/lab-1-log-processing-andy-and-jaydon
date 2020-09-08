#!/bin/bash
DIR="$1"
FILE="hours_dist"
(cd "$DIR" || exit
echo >> TEMP.txt #create temp file
find . -name "failed_login_data.txt" -print0 | xargs -0 awk '{ print $3 }' | sort | uniq -c >> TEMP.txt #Grabs text from all files in directory that match the pattern, then sorts it and puts the names into their own lines, then counts the times each name is found and puts it in a file
awk 'NF {print "data.addRow([\047" $2"\047, " $1"]);"}' TEMP.txt >> TEMP1.txt) #Takes the earlier output and creates a new line using the variables defined in awk and puts the output into a file.
./bin/wrap_contents.sh "$DIR"/TEMP1.txt html_components/"$FILE" "$FILE".html #Wrap temp file contents in html and create html file
mv "$FILE".html "$DIR" #Moves the created html file to the given directory
rm "$DIR"/TEMP.txt #Remove temp files
rm "$DIR"/TEMP1.txt
