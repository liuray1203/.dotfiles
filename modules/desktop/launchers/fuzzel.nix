{ pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        width = 80;
        lines = 15;
        font = "JetBrainsMono Nerd Font:size=16";
        horizontal-pad = 40;
        vertical-pad = 30;
      };
    };
  };
}
