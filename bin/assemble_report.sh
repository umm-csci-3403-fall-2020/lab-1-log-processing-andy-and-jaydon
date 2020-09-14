#!/bin/bash
DIR=$1 #Inputted directory
(cd "$DIR" || exit

#Combine all three html files into temp file
cat country_dist.html hours_dist.html username_dist.html | tee CLLECTN.txt)

#Wrap data from temp file in overall header and footer and create new html file
./bin/wrap_contents.sh "$DIR"/CLLECTN.txt html_components/summary_plots failed_login_summary.html

rm "$DIR"/CLLECTN.txt #Remove temp file
mv failed_login_summary.html "$DIR"/failed_login_summary.html #Move final output file into parent directory
