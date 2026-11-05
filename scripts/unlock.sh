#!/usr/bin/env bash
# The Hyprland session starts play_unlock_sound.sh as a persistent watcher.
# Keep this script focused on locking to avoid starting a second sound watcher.
exec hyprlock
