#!/bin/bash

#touch "$1/failed_login_data.txt"
#touch "$1/intermediate.txt"
(cd "$1"
grep --exclude="interm.txt" -rh "Failed" . >> "interm.txt"

awk '{printf "%s ",$1} {printf "%s ",$2} {split($3, a, ":"); printf "%s ",a[1]} {for (H=1;H<=NF;H++) if ($H == "user") {printf "%s ", $(H+1)};} {for (I=1;I<=NF;I++) if ($I == "from") {printf "%s\n ",$(I+1)};}' "interm.txt" >> "failed_login_data.txt"

rm "interm.txt"
)
#This script uses grep to pass the failed logins into an intermediate file. It then uses awk to extract what we want from the intermediate file in the correct format, and then deletes the intermediate file.
