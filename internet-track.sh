#/usr/bin/env bash

# Creates ~11 KB per min of data in file
# Estimated file size for 1 day of logging ~15.84 MB

NOW=$(date +"%m_%d_%Y")
INTERNET_LOG=$NOW"_internet.log"
echo 'starting internet monitoring pinging multiple hosts every 5 seconds' 2>&1 | tee -a $INTERNET_LOG

function pingHost {
    echo "Pinging Host: "$1 2>&1 | tee -a $INTERNET_LOG
    ping -o $1 2>&1 | tee -a $INTERNET_LOG
}

while true; do
  for host in google.com yahoo.com brettlischalk.com; do
    pingHost ${host} &
  done
  sleep 5
done
