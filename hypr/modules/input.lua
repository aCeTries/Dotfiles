-- Keyboard, touchpad and device-specific settings.

hl.config({
    input = {
        kb_layout = "us",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
})

-- Name copied from the original `hyprctl devices` entry in your old config.
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})
