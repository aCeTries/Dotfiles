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
    
    # Determine play/pause icon
    if [ "$status" = "Playing" ]; then
        play_icon="⏸"
        song_icon="🎵"
    else
        play_icon="▶"
        song_icon="⏸"
    fi
    
    # Display format with control buttons
    echo "$song_icon $artist - $title
⏮ $play_icon ⏭"
else
    # No music playing, show nothing
    exit 0
fi 
