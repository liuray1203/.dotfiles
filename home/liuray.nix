{ config, pkgs, ... }:

{
  home.username = "liuray";
  home.homeDirectory = "/home/liuray";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  imports =[
  ../modules/shell/cli.nix 
  ../modules/apps/gui.nix
  ../modules/wm/hyprland.nix
  ../modules/desktop/waybar/waybar.nix
 ];

}

