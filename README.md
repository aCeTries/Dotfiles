My Arch Linux Setup
A short overview of my Linux desktop setup, intended to help someone understand what I use and how a few parts are configured. 
At a glance
Component	Setup / notes
Operating system	Arch Linux
CPU	AMD Ryzen 5 4600H with Radeon Graphics
Architecture	x86_64
Discrete GPU	NVIDIA GeForce GTX 1650 Mobile / Max-Q (TU117M); kernel driver: nvidia
Integrated GPU	AMD Radeon Vega / Renoir graphics; kernel driver: amdgpu
Physical memory	8 GB RAM
Swap	3.6 GB zram swap device (/dev/zram0)
Main storage	476.9 GB NVMe drive (/dev/nvme0n1)
Linux root filesystem	194.3 GB ext4 partition mounted at /
Linux boot partition	1 GB vfat partition mounted at /boot
Dotfiles repository	aCeTries/Dotfiles on GitHub
Other operating system	Windows; the machine is dual-booted with Linux and Windows
Window manager / compositor	Hyprland
Display server protocol	Wayland
Animated wallpaper	mpvpaper
Wallpaper preference	Video wallpaper; I experimented with a portrait video filling a landscape display, accepting cropping
Terminal emulator	Kitty
UI font	Pixeloid Sans
File manager	Dolphin
Application launcher	Wofi
Status bar / taskbar	Waybar
Lock screen	Hyprlock, with custom scripts
Battery reminder	Custom low-battery reminder script
Power menu	Custom Eww interface with power-off and restart buttons
Shell prompt	Starship has come up in my Linux ricing/setup discussions; confirm whether it is part of the current Arch install
Previous Linux desktop	Linux Mint with Cinnamon was part of my earlier Linux setup/ricing history


Hardware specifications
Collected from the system information supplied for this README. GPU names and drivers are based on lspci -k; partition sizes and mount points are based on lsblk.
Processor
- Model: AMD Ryzen 5 4600H with Radeon Graphics
- Architecture: x86_64
Graphics
This system has hybrid graphics: integrated AMD graphics plus a discrete NVIDIA GPU.
GPU	Device	Kernel driver in use
Discrete	NVIDIA TU117M / GeForce GTX 1650 Mobile / Max-Q	nvidia
Integrated	AMD Renoir / Radeon Vega Series (Radeon Vega Mobile Series)	amdgpu


The reported NVIDIA kernel modules include nouveau, nvidia_drm, and nvidia; the active driver shown by lspci -k is nvidia. The AMD driver in use is amdgpu. This README does not assume a particular PRIME/offload configuration.
Memory
- Physical RAM: 8 GB
- Swap: 3.6 GB zram device (/dev/zram0)
The zram device is compressed RAM-backed swap, not a separate physical disk partition.
Storage and partitions
The reported main drive is a 476.9 GB NVMe SSD, shown as /dev/nvme0n1. Current partition information supplied for this document: 
Partition	Size	Filesystem	Mount point	Notes
/dev/nvme0n1p1	100 MB	vfat	—	Partition purpose not confirmed
/dev/nvme0n1p2	16 MB	Not reported	—	Partition purpose not confirmed
/dev/nvme0n1p3	167.7 GB	NTFS	—	Not mounted in the supplied output
/dev/nvme0n1p4	956 MB	NTFS	—	Partition purpose not confirmed
/dev/nvme0n1p5	112.3 GB	NTFS	—	Not mounted in the supplied output
/dev/nvme0n1p6	1 GB	vfat	/boot	Linux boot partition
/dev/nvme0n1p7	194.3 GB	ext4	/	Linux root filesystem


The machine dual-boots Arch Linux and Windows, and the NTFS partitions are consistent with Windows-accessible partitions. Their exact roles and which one contains the Windows installation have not been confirmed, so they are not labelled more specifically here. Mount points above reflect the output shared and may differ from the current live system.
Dotfiles and customization source
The customization files are collected in the public GitHub repository: aCeTries/Dotfiles. Use that repository as the primary source for the actual configuration files and scripts; this README is an overview and does not reproduce every file.
The UI font I use is Pixeloid Sans.
Desktop environment
I use Hyprland on Wayland rather than a traditional desktop environment such as Cinnamon. Hyprland's configuration is typically stored in:
~/.config/hypr/hyprland.conf
To reload Hyprland after changing its configuration:
hyprctl reload
Dual boot
The computer dual-boots Arch Linux and Windows on the reported NVMe drive. The supplied partition layout is documented in the Hardware specifications section. The bootloader and exact Windows partition assignment have not been confirmed.
