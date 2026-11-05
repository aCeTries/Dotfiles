#!/usr/bin/env bash
# Run mpvpaper while on AC power; stop it while the battery is discharging.
# Started by Hyprland. The lock prevents duplicate watcher instances.

set -u

WALLPAPER="$HOME/Pictures/Wallpapers/video2.mp4"
LOCK_FILE="${XDG_RUNTIME_DIR:-/tmp}/mpvpaper-power-${UID}.lock"

exec 9>"$LOCK_FILE"
flock -n 9 || exit 0

on_battery() {
    local status_file status
    for status_file in /sys/class/power_supply/BAT*/status; do
        [[ -r "$status_file" ]] || continue
        IFS= read -r status < "$status_file" || continue
        [[ "$status" == "Discharging" ]] && return 0
    done
    return 1
}

start_wallpaper() {
    [[ -f "$WALLPAPER" ]] || return 0
    if ! pgrep -u "$UID" -x mpvpaper >/dev/null 2>&1; then
        mpvpaper -o "no-audio --loop-file=inf" '*' "$WALLPAPER" >/dev/null 2>&1 &
    fi
}

stop_wallpaper() {
    pkill -u "$UID" -x mpvpaper >/dev/null 2>&1 || true
}

cleanup() {
    stop_wallpaper
    exit 0
}
trap cleanup TERM INT

while true; do
    if on_battery; then
        stop_wallpaper
    else
        start_wallpaper
    fi
    sleep 30
done
