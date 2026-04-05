{ config, pkgs, ... }:

let
  waybarHypr = pkgs.waybar.overrideAttrs (old: {
    mesonFlags = old.mesonFlags ++ [ "-Dhyprland=enabled" ];
  });
in
{
  home.packages = [ waybarHypr ];

  xdg.configFile."waybar/config.jsonc".source = ./config.jsonc;
  xdg.configFile."waybar/style.css".source = ./style.css;
  #xdg.configFile."waybar/mocha.css".source = ./mocha.css;
}

