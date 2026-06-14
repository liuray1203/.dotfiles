{ inputs, pkgs, ... }:

{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.ags = {
    enable = false;

    # 指向 .dotfiles 內的設定檔目錄
    configDir = ./.;

    # 額外需要的套件
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk_6_0
      accountsservice
    ];

  };
}
