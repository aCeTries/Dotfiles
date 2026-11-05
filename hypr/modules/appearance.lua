-- Core layout, borders, opacity, shadows and blur.

hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 5,
        border_size = 2,
        ["col.active_border"] = "rgb(fdfbfc)",
        ["col.inactive_border"] = "rgba(595959aa)",
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 10,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 0.9,

        shadow = {
            enabled = true,
            range = 16,
            render_power = 4, -- Hyprland 0.57 caps this at 4.
            color = "rgba(00000033)",
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
            new_optimizations = true,
            xray = false,
            -- Keep the default Kawase variant for a lighter GPU workload.
        },

        wobble = {
            enabled = true,
            mesh = 8,
            stiffness = 180,
            damping = 14,
            mass = 1,
            intensity = 0.15,
        },
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = 1,
        disable_hyprland_logo = true,
    },
})
