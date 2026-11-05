-- Curves are declared once and reused by animation leaves.
hl.config({ animations = { enabled = true } })

hl.curve("easeOutQuint", {
    type = "bezier",
    points = { { 0.23, 1.0 }, { 0.32, 1.0 } },
})
hl.curve("easeInOutCubic", {
    type = "bezier",
    points = { { 0.65, 0.05 }, { 0.36, 1.0 } },
})
hl.curve("linear", {
    type = "bezier",
    points = { { 0.0, 0.0 }, { 1.0, 1.0 } },
})
hl.curve("almostLinear", {
    type = "bezier",
    points = { { 0.5, 0.5 }, { 0.75, 1.0 } },
})
hl.curve("quick", {
    type = "bezier",
    points = { { 0.15, 0.0 }, { 0.1, 1.0 } },
})

hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
