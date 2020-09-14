#!/bin/bash
DIR="$1"
FILE="country_dist"
(cd "$DIR" || exit

# shellcheck disable=SC2016
#Grabs text from all files in directory that match the pattern, then sorts it and puts the names into their own lines, then counts the times each name is found and puts it in a file
find . -name "failed_login_data.txt" -print0 | xargs -0 awk '{ print $5 }' | sort | tee TMP

#Takes the file with just the IPs in it and joins the country to the IP using the map file
join TMP ../etc/country_IP_map.txt | tee TMP1

#Takes the countries column, sorts it, and then counts the duplicates and prints it to a file
awk '{ print $2 }' TMP1 | sort | uniq -c | tee TMP2

#Takes the earlier output and creates a new line using the variables defined in awk and puts the output into a file.
awk 'NF {print "data.addRow([\047" $2"\047, " $1"]);"}' TMP2 | tee TMP3)

#Wrap temp file contents in html and create html file
./bin/wrap_contents.sh "$DIR"/TMP3 html_components/"$FILE" "$FILE".html

mv "$FILE".html "$DIR" #Moves the created html file to the given directory
rm "$DIR"/TMP "$DIR"/TMP1 "$DIR"/TMP2 "$DIR"/TMP3 #Remove temp files
