#!/bin/sh

export_data_periodically() {
  mkdir -p /usr/src/firebase-data
  while true; do
    echo "Exporting Firebase emulator data..."
    firebase emulators:export /usr/src/firebase-data --force
    echo "Data export completed. Sleeping for 60 seconds."
    sleep 60 # Adjust the interval as needed
  done
}

firebase emulators:start --import=/usr/src/firebase-data &

export_data_periodically &

wait $!
