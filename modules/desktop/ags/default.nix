{ inputs, pkgs, ... }:

{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.ags = {
    enable = true;

    # 這裡可以指向你的設定檔目錄
    # configDir = ../../../config/ags;

    # 額外需要的套件，例如用於顯示圖標或執行腳本
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk_6_0
      accountsservice
    ];
  };
}
