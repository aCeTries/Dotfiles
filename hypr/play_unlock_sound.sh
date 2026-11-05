#!/usr/bin/env bash
# Persistent watcher: play the unlock sound after each Hyprlock session.
set -u

while true; do
    while ! pgrep -x hyprlock >/dev/null 2>&1; do
        sleep 1
    done

    while pgrep -x hyprlock >/dev/null 2>&1; do
        sleep 0.2
    done

    sleep 0.5
    pw-play "$HOME/.config/hypr/sounds/intro.wav" || true
done
