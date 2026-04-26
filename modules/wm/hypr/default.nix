{ ... }:

{
  imports = [
    ./appearance.nix
    ./animations.nix
    ./input.nix
    ./keybinds.nix
    ./package.nix
    ./windowrules.nix
  ];
 
 xdg.configFile."pyprland.toml".source = ./pyprland.toml;

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = ",preferred,auto,auto";

      exec-once = [
        "waybar"
	"fcitx5"
	"pypr"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];
    };
  };
}

