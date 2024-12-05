#!/bin/bash

NAME="IACA CONTEXT"
PID=()

function status() {
    if [ ${#PID[@]} -ne 0 ]; then
        echo "running"
    else
        echo "stopped"
    fi
}

function start() {
    if [ "$(status)" == "stopped" ]; then
        echo "Welcome IACA Desktop manager minimal image !"
        echo "* DISPLAY = '$DISPLAY'"
        
        PID[0]=$(openbox &>/dev/null & echo $!)
        PID[1]=$(pcmanfm --desktop &> /dev/null & echo $!)
    fi
}

function stop() {
    if [ "$(status)" == "running" ]; then
        for pid in "${PID[@]}"; do
            if [ -n "$pid" ]; then
                kill "$pid"
            fi
        done
        unset PID
    fi
}


case "$1" in
    start)
        echo "Starting the service..."
        start
        ;;
    stop)
        echo "Stopping the service..."
        stop
        ;;
    restart)
        echo "Restarting the service..."
        stop
        start
        ;;
    status)
        echo "$NAME : $(status)"
        ;;
    *)
        echo "Usage: $0 {start|stop|status}"
        exit 1
        ;;
esac