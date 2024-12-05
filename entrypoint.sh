#!/bin/bash

handle_ctrl_c() {
    echo "CTRL+C detected. Exiting..."
    context stop
    sleep 1
    exit 0
}

context start

trap handle_ctrl_c SIGINT

echo "Press CTRL+C to exit..."

while true; do
    sleep 1
done

bash