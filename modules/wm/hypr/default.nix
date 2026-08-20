{ ... }:

{
  imports = [
    ./package.nix
    ./hyprlock.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
  };

  xdg.configFile."hypr/hyprland.lua".source = ./init.lua;
  xdg.configFile."hypr/modules".source = ./modules;
}


