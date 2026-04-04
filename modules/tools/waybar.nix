{ pkgs, lib, ... }:

{
  # 安裝 Waybar 套件
  home.packages = [
    pkgs.waybar
  ];

  # 管理 Waybar 配置資料夾
  home.directory.".config/waybar" = {
    source = ./waybar; # 對應 dotfiles/modules/tools/waybar/waybar 資料夾
  };

  # 選擇性：設定環境變數，例如 Waybar 的 theme 或其他選項
  # home.sessionVariables.WAYBAR_THEME = "mocha";
}

