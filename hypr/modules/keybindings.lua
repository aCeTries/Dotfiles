-- ALT remains the main modifier to preserve the established workflow.
local mod = "ALT"

hl.bind(mod .. " + Z", hl.dsp.exec_cmd("kitty"))
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + M", hl.dsp.exit())
hl.bind(mod .. " + E", hl.dsp.exec_cmd("dolphin"))
hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd("pgrep -x wofi >/dev/null && pkill -x wofi || wofi --show drun"))

hl.bind(mod .. " + V", hl.dsp.window.float())
hl.bind(mod .. " + P", hl.dsp.window.pseudo())

-- Directional focus (WASD)
hl.bind(mod .. " + A", hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. " + D", hl.dsp.focus({ direction = "r" }))
hl.bind(mod .. " + W", hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. " + S", hl.dsp.focus({ direction = "d" }))

-- ALT+CTRL+S avoids colliding with ALT+S (focus down).
hl.bind(mod .. " + CTRL + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind("SUPER + L", hl.dsp.exec_cmd("bash ~/.config/scripts/unlock.sh"))

for i = 1, 9 do
    hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

hl.bind("Print", hl.dsp.exec_cmd("mkdir -p ~/Pictures/Screenshots && hyprshot -m window -o ~/Pictures/Screenshots -f \"$(date +'%Y-%m-%d_%H-%M-%S').png\""))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("mkdir -p ~/Pictures/Screenshots && hyprshot -m region -o ~/Pictures/Screenshots -f \"$(date +'%Y-%m-%d_%H-%M-%S').png\""))
