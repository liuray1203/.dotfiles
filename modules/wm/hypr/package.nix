{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    hyprlauncher
    hyprlock
    hyprshot
  ];
}

