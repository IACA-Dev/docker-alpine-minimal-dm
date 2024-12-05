#!/bin/bash

handle_ctrl_c() {
    echo "CTRL+C detected. Exiting..."
    exit 0
}

trap handle_ctrl_c SIGINT

echo "Press CTRL+C to exit..."

while true; do
    sleep 1
done