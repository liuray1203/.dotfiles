-- modules/autostart.lua
-- 對應 default.nix 裡的 exec-once / env

hl.exec_cmd("waybar")
hl.exec_cmd("fcitx5")
hl.exec_cmd("awww-daemon")
hl.exec_cmd("sleep 1 && awww img /home/liuray/.dotfiles/linux-nixos-7q.jpg")

hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE", "24")

-- 讓 Electron 應用（Spotify、VS Code 等）使用原生 Wayland，避免 XWayland 縮放模糊
hl.env("NIXOS_OZONE_WL", "1")
