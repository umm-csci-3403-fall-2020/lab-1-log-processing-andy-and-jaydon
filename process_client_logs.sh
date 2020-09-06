#!/bin/bash

touch /home/$USER/lab-1-log-processing-andy-and-jonah/$1/failed_login_data.txt

touch /home/$USER/lab-1-log-processing-andy-and-jonah/$1/intermediate.txt

grep "Failed" $1/* > intermediate.txt

awk '{printf "%s ",$1} {printf "%s ",$2} {split($3, a, ":"); printf "%s ",a[1]} {for (H=1;H<=NF;H++) if ($H == "user") {printf "%s ", $(H+1)};} {for (I=1;I<=NF;I++) if ($I == "from") {printf "%s\n ",$(I+1)};} ' intermediate.txt > $1/failed_login_data.txt

rm $1/intermediate.txt

#This script gives the desired output with some extra information which i believe comes from the grep implementation.