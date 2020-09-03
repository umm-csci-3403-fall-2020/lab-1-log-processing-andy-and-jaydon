#!/bin/bash

touch /home/$USER/lab-1-log-processing-andy-and-jonah/$1/failed_login_data.txt

cat  $1/* >> $1/failed_login_data.txt
