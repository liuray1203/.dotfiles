{ ... }:

{
  imports = [
    ./appearance.nix
    ./animations.nix
    ./input.nix
    ./keybinds.nix
    ./package.nix
  ];
 

  wayland.windowManager.hyprland = {
    enable = true;

    configType = "hyprlang";

    settings = {
      monitor = ",preferred,auto,auto";

      exec-once = [
        "waybar"
	      "fcitx5"
        "awww-daemon"
        "sleep 1 && awww img /home/liuray/.dotfiles/linux-nixos-7q.jpg"
      ];

      env = [
        "XCURSOR_THEME,Bibata-Modern-Ice"
        "XCURSOR_SIZE,24"

        "HYPRCURSOR_THEME,Bibata-Modern-Ice"
        "HYPRCURSOR_SIZE,24"

        # 讓 Electron 應用（Spotify、VS Code 等）使用原生 Wayland，避免 XWayland 縮放模糊
        "NIXOS_OZONE_WL,1"
      ];
    };
  };
}


