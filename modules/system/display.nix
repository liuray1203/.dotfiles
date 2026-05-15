{ pkgs, config, ... }:

{
  # 啟用硬體繪圖支援 (必要的)
  hardware.graphics.enable = true;

  # 啟用 Hyprland 系統組件 (處理 Polkit, Portals 等)
  programs.hyprland.enable = true;

  # 啟用 NVIDIA 專有驅動
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # 配置 PRIME 雙顯卡切換 (Intel + NVIDIA)
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      # 根據 lspci 結果填寫 Bus ID
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # 停用 X server 與 SDDM (改用 TTY 登入)
  services.xserver.enable = false;
  services.displayManager.sddm.enable = false;

  # XDG Portal 設定 (wlroots/layer-shell 支援必要項)
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };
}
