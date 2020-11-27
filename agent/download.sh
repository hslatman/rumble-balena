#!/usr/bin/env bash

set -me

# Ensure the RUMBLE_DOWNLOAD_URL is set
if [ -z "${RUMBLE_DOWNLOAD_URL}" ]; then
    echo "Missing RUMBLE_DOWNLOAD_URL environment variable"
    exit 1
fi

# Download the Rumble Agent
curl -o rumble-agent.bin ${RUMBLE_DOWNLOAD_URL} && chmod u+x rumble-agent.bin

# Run the Rumble Agent, making the binary available in /opt/rumble
./rumble-agent.bin