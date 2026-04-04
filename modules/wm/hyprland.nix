{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    waybar
    hyprlauncher
    hyprlock
    hyprshot
  ];
}

