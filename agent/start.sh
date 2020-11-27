#!/usr/bin/env bash

set -me

# Ensure we have a RUMBLE_AGENT_HOST_ID in the container environment
if [ -z "${RUMBLE_AGENT_HOST_ID}" ]; then
    FILE=/.rumble/RUMBLEID
    if [ -f "$FILE" ]; then
        export $(cat ${FILE} | xargs)
    else 
        ID=$(openssl rand -hex 16)
        echo "RUMBLE_AGENT_HOST_ID=$ID" >> $FILE
        export RUMBLE_AGENT_HOST_ID=$ID
    fi
fi

# Find the Rumble Agent binary
RUMBLE=$(find /opt/rumble -executable -type f -exec ls -l {} \; | awk '{ print $9 }')

# Run the Rumble Agent in manual mode
$RUMBLE manual