#/usr/bin/env bash

# Creates ~11 KB per min of data in file
# Estimated file size for 1 day of logging ~15.84 MB

NOW=$(date +"%m_%d_%Y")
INTERNET_LOG=$NOW"_internet.log"
echo -e 'starting internet monitoring pinging multiple hosts every 5 seconds' 2>&1 | tee -a $INTERNET_LOG

function pingHost {
    echo -e "Pinging Host: $1" 2>&1 | tee -a $INTERNET_LOG
    ping -o $1 2>&1 | tee -a $INTERNET_LOG
}

while true; do
  echo -e "----------------------------------------+" 2>&1 | tee -a $INTERNET_LOG
  echo Starting ping sweep at: `date` 2>&1 | tee -a $INTERNET_LOG
  echo -e '\n' 2>&1 | tee -a $INTERNET_LOG

  for host in google.com yahoo.com brettlischalk.com; do
    pingHost ${host}
  done

  echo -e '\n' 2>&1 | tee -a $INTERNET_LOG
  echo Finished ping sweep at: `date` 2>&1 | tee -a $INTERNET_LOG
  echo "----------------------------------------+" 2>&1 | tee -a $INTERNET_LOG

  sleep 5
done
