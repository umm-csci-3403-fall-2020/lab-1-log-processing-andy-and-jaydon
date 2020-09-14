#!/bin/bash
DIR=$1 #Inputted directory
(cd "$DIR" || exit
cat country_dist.html hours_dist.html username_dist.html | tee CLLECTN.txt)

./bin/wrap_contents.sh "$DIR"/CLLECTN.txt html_components/summary_plots failed_login_summary.html
rm "$DIR"/CLLECTN.txt
mv failed_login_summary.html "$DIR"/failed_login_summary.html
