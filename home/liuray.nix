{ config, pkgs, ... }:

{
  home.username = "liuray";
  home.homeDirectory = "/home/liuray";

  home.stateVersion = "25.11";

  home.sessionVariables = {
  NPM_CONFIG_PREFIX = "$HOME/.npm-global";
  };

  home.sessionPath = [
  "$HOME/.npm-global/bin"
  ];


  programs.home-manager.enable = true;
  
  stylix.targets.hyprland.enable = false;  # 加这一行

  imports =[
  ../modules/shell/cli.nix 
  ../modules/apps/gui.nix
  ../modules/wm/hypr/default.nix
  ../modules/desktop/waybar/waybar.nix
  ../modules/shell/zsh.nix
 ];

}

