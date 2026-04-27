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

    settings = {
      monitor = ",preferred,auto,auto";

      exec-once = [
        "waybar"
	      "fcitx5"
        "swww-daemon"
        "swww img /home/liuray/.dotfiles/images.jpeg"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];
    };
  };
}


