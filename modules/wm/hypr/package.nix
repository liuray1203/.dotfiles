{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    hyprlock
    hyprshot
    awww
    brightnessctl
    waybar
  ];
}

