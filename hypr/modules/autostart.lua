-- Startup applications and scripts.
hl.on("hyprland.start", function()
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("bash ~/.config/eww/scripts/start.sh")
    hl.exec_cmd("bash ~/.config/hypr/play_unlock_sound.sh")

    -- Runs the animated wallpaper on AC power and pauses it on battery.
    hl.exec_cmd("bash ~/.config/hypr/scripts/wallpaper-power.sh")
end)
