#!/bin/bash
HERE=$(pwd)
#Extraction and processing
mkdir SCRATCH
for f in "$@"
do
	Var="$f"
	Name=$(basename -s .tgz "$Var")
	mkdir SCRATCH/"$Name"
	tar -xf "$Var" -C SCRATCH/"$Name"
	./bin/process_client_logs.sh SCRATCH
done
#Rest of the commands
./bin/create_username_dist.sh SCRATCH > /dev/null
./bin/create_hours_dist.sh SCRATCH > /dev/null
./bin/create_country_dist.sh SCRATCH > /dev/null
./bin/assemble_report.sh SCRATCH > /dev/null
mv SCRATCH/failed_login_summary.html "$HERE"
