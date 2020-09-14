#!/bin/bash
HERE=$(pwd)
#Extraction and processing
mkdir SCRATCH #Create temp dir
for f in "$@" #Start for loop for every inputted argument
do
	Var="$f" #set name for each argument
	Name=$(basename -s .tgz "$Var") #Store file name into variable
	mkdir SCRATCH/"$Name" #Make directory based on file name in temp dir
	tar -xf "$Var" -C SCRATCH/"$Name" #Extract tar into proper dir inside temp dir
	./bin/process_client_logs.sh SCRATCH #Process logs in temp dir and create proper failed_login_data.txt file
done
#Rest of the commands to run
./bin/create_username_dist.sh SCRATCH > /dev/null #Create html file for usernames
./bin/create_hours_dist.sh SCRATCH > /dev/null #Create html file for hours
./bin/create_country_dist.sh SCRATCH > /dev/null #Create html file for countries
./bin/assemble_report.sh SCRATCH > /dev/null #Combine html files together into main html file
mv SCRATCH/failed_login_summary.html "$HERE" #Move main html file to top directory for analysis
