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
        "ags"
	      "fcitx5"
        "awww-daemon"
        "sleep 1 && awww img /home/liuray/.dotfiles/images.jpeg"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];
    };
  };
}


