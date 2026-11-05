#!/bin/bash

# Check if Spotify is running and playing
if ! pgrep -x "spotify" > /dev/null; then
    exit 0
fi

# Get Spotify status using playerctl
status=$(playerctl -p spotify status 2>/dev/null)

if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
    # Get song info
    artist=$(playerctl -p spotify metadata artist 2>/dev/null | cut -c1-20)
    title=$(playerctl -p spotify metadata title 2>/dev/null | cut -c1-30)
    
    # Determine icon based on status
    if [ "$status" = "Playing" ]; then
        icon="🎵"
    else
        icon="⏸"
    fi
    
    # Display format
    echo "$icon $artist - $title"
else
    # No music playing, show nothing
    exit 0
fi 
