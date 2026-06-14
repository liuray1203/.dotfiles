{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    hyprlauncher
    hyprlock
    hyprshot
    awww
    brightnessctl
    fuzzel
  ];
}

