{
  home.packages = [
    pkgs.waybar
  ];

  xdg.configFile."waybar/config.jsonc".source = ./waybar/config.jsonc;
  xdg.configFile."waybar/style.css".source = ./waybar/style.css;
  xdg.configFile."waybar/mocha.css".source = ./waybar/mocha.css;
}

