{ pkgs, ... }:

{
  # 停用 X server 與 SDDM (改用 TTY 登入)
  services.xserver.enable = false;
  services.displayManager.sddm.enable = false;

  # 啟用 Mango Compositor (基於 dwl)
  programs.mango.enable = true;

  # TTY1 自動啟動 Mango
  # 登入 TTY1 後會自動執行 mango 指令
  environment.loginShellInit = ''
    if [[ "$(tty)" == /dev/tty1 ]]; then
      exec mango
    fi
  '';

  # XDG Portal 設定 (wlroots/layer-shell 支援必要項)
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };

  # 基礎套件與 Mango 建議依賴
  environment.systemPackages = with pkgs; [
    brightnessctl
    swww
    # Mango 必備/建議工具
    foot            # 終端機
    bemenu          # 啟動器 (Wayland 原生)
    mako            # 通知服務
    wl-clipboard    # 剪貼簿工具
    grim            # 截圖工具
    slurp           # 選取區域工具
  ];
}

