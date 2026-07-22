{ pkgs, config, ... }:

{
  # 啟用硬體繪圖支援 (必要的)
  hardware.graphics.enable = true;

  # 啟用 Hyprland 系統組件 (處理 Polkit, Portals 等)
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  programs.niri.enable = true;

  # 停用 X server 與 SDDM (改用 TTY 登入)
  services.xserver.enable = false;
  services.displayManager.sddm.enable = false;

  # XDG Portal 設定
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };
}
