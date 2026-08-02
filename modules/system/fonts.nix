{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    font-awesome
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    nerd-fonts.meslo-lg 
  ];

  fonts.fontconfig.defaultFonts = {
    sansSerif = [ "Noto Sans CJK TC" ];
    serif = [ "Noto Serif CJK TC" ];
    monospace = [ "Noto Sans Mono CJK TC" ];
    emoji = [ "Noto Color Emoji" ];
  };
}

