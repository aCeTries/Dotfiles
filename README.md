# Arch Linux Dotfiles

Personal dotfiles for an Arch Linux laptop running Hyprland on Wayland.

## Hardware

| Component | Details |
|---|---|
| CPU | AMD Ryzen 5 4600H with Radeon Graphics |
| Integrated GPU | AMD Radeon Vega / Renoir (amdgpu) |
| Discrete GPU | NVIDIA GeForce GTX 1650 Mobile / Max-Q (TU117M) |
| Memory | 8 GB RAM with zram swap |
| Storage | NVMe SSD |
| Other OS | Windows (dual boot) |

## Desktop

- **Compositor:** Hyprland (Lua configuration, 0.57+)
- **Terminal:** Kitty
- **File manager:** Dolphin
- **Launcher:** Wofi
- **Bar:** Waybar
- **Widgets:** Eww
- **Lock screen / idle:** Hyprlock and Hypridle
- **Font:** Pixeloid Sans
- **Wallpaper:** mpvpaper video wallpaper

## Repository layout

- `hypr/` — Hyprland Lua entry point, modules, idle/lock configuration and helper scripts.
- `eww/` — Eww widgets and styles.
- `kitty/` — Kitty terminal configuration and theme.
- `waybar/` — Waybar configuration, styles and scripts.
- `wofi/` — Wofi configuration and styles.
- `scripts/` — shared helper scripts.
- `wallpaper/` — static wallpaper assets.

The old Hyprland 0.56-and-earlier configuration is retained at `hypr/legacy/hyprland.conf` for reference. Hyprland 0.57+ uses `hypr/hyprland.lua`.

## Hyprland setup

Copy the contents of `hypr/` into `~/.config/hypr/`. Keep any local-only assets (for example `sounds/intro.wav`) in place. The Lua entry point loads settings from `modules/`.

After copying, check:

```bash
hyprctl reload
hyprctl configerrors
hyprctl monitors all
```

The monitor module currently targets the built-in `eDP-1` laptop panel at preferred mode and scale 1.0. Change it if your output name differs.

## Performance and battery

- Blur uses one pass, a small radius, and Hyprland's optimised blur path. The default Kawase variant is retained instead of heavier shader variants.
- The wobble effect is intentionally subtle.
- `scripts/wallpaper-power.sh` runs the animated wallpaper on AC power and stops it while a battery reports `Discharging`. It checks every 30 seconds and restarts the wallpaper when AC power returns.
- The wallpaper path expected by the script is `~/Pictures/Wallpapers/video2.mp4`.
- Hyprland starts the wallpaper watcher and the unlock-sound watcher at session startup.

### Optional power profiles

If you want to use `power-profiles-daemon`, first check whether TLP is already active:

```bash
systemctl is-active tlp.service
```

Do not run TLP and power-profiles-daemon together. If TLP is not in use, you can install and enable power-profiles-daemon:

```bash
sudo pacman -S power-profiles-daemon
sudo systemctl enable --now power-profiles-daemon.service
powerprofilesctl list
powerprofilesctl set power-saver
```

Use `powerprofilesctl set balanced` when you want the balanced profile again. Available profiles depend on laptop firmware and hardware support.

### Useful diagnostics

```bash
powerprofilesctl get
nvidia-smi
cat /sys/class/power_supply/BAT0/status
cat /sys/class/power_supply/BAT0/capacity
```

For the NVIDIA GPU's runtime-power state, find its PCI device and inspect `power/runtime_status` and `power/control` under `/sys/bus/pci/devices/<device>/`. Do not force runtime power-management settings until the current driver and device state have been checked.

## Notes

- The configuration preserves the established ALT-based keybindings. `ALT+S` focuses down; `ALT+CTRL+S` toggles the `magic` special workspace.
- The unlock-sound watcher expects `pw-play` and `~/.config/hypr/sounds/intro.wav`.
- Other referenced utilities include `nm-applet`, `waybar`, `hypridle`, Eww, `wpctl`, `brightnessctl`, `playerctl`, and `hyprshot`.
