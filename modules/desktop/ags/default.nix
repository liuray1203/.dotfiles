{ inputs, pkgs, ... }:

{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.ags = {
    enable = true;

    # 指向 .dotfiles 內的設定檔目錄
    configDir = ../../../config/ags;

    # 額外需要的套件
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk_6_0
      accountsservice
    ];
  };
}
