{ config, pkgs, ... }:

{
  home.username = "liuray";
  home.homeDirectory = "/home/liuray";

  home.stateVersion = "25.11";

  home.sessionVariables = {
  NPM_CONFIG_PREFIX = "$HOME/.npm-global";
  };

  #home.sessionPath = [
  #"$HOME/.npm-global/bin"
  #];


  programs.home-manager.enable = true;
  
  stylix.targets.hyprland.enable = false;  # 加这一行

  imports =[
  ../modules/shell/cli.nix 
  ../modules/apps/gui.nix
  ../modules/wm/hypr
  ../modules/desktop/waybar/waybar.nix
  #../modules/desktop/ags/default.nix
  ../modules/shell/zsh
  ../modules/apps/terminal/wezterm
  #../modules/apps/terminal/terax
  ../modules/desktop/launchers
  ../modules/apps/nvim
  ../modules/desktop/filemanager/nemo.nix
  ../modules/ai/ai.nix
 ];

}

