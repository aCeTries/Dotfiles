#!/usr/bin/env bash
# Keep this running in the background. Wait for each hyprlock session to end,
# then play the unlock sound. The previous one-shot loop could exit before the
# first lock screen ever appeared.

set -u

while true; do
    # Wait until the lock screen starts.
    while ! pgrep -x hyprlock >/dev/null 2>&1; do
        sleep 1
    done

    # Wait until the lock screen exits (successful unlock).
    while pgrep -x hyprlock >/dev/null 2>&1; do
        sleep 0.2
    done

    sleep 0.5
    pw-play "$HOME/.config/hypr/sounds/intro.wav" || true
done
