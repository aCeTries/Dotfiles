-- Startup applications and scripts.
-- `hl.exec_cmd` is asynchronous; commands do not need trailing '&'.

hl.on("hyprland.start", function()
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("bash ~/.config/eww/scripts/start.sh")
    hl.exec_cmd("bash ~/.config/hypr/play_unlock_sound.sh")
    hl.exec_cmd("mpvpaper -o 'no-audio --loop-file=inf' '*' ~/Pictures/Wallpapers/video2.mp4")
end)
