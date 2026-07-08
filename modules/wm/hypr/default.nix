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
      ];
    };
  };
}


