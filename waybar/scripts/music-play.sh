#!/bin/bash

# Check if Spotify is running
if ! pgrep -x "spotify" > /dev/null; then
    exit 0
fi

# Get Spotify status using playerctl
status=$(playerctl -p spotify status 2>/dev/null)

if [ "$status" = "Playing" ]; then
    echo "⏸"
elif [ "$status" = "Paused" ]; then
    echo "▶"
else
    exit 0
fi 
