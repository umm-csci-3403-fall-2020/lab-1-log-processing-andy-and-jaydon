#!/bin/bash

touch "/home/$USER/lab-1-log-processing-andy-and-jonah/$1/failed_login_data.txt"
touch "/home/$USER/lab-1-log-processing-andy-and-jonah/$1/intermediate.txt"

grep -h "Failed" $1/* > "intermediate.txt"

awk '{printf "%s ",$1} {printf "%s ",$2} {split($3, a, ":"); printf "%s ",a[1]} {for (H=1;H<=NF;H++) if ($H == "user") {printf "%s ", $(H+1)};} {for (I=1;I<=NF;I++) if ($I == "from") {printf "%s\n ",$(I+1)};}' "intermediate.txt" > "$1/failed_login_data.txt"

rm "$1/intermediate.txt"

#This script uses grep to pass the failed logins into an intermediate file. It then uses awk to extract what we want from the intermediate file in the correct format, and then deletes the intermediate file.
