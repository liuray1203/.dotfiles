{ pkgs, config, ... }:

{
  # 啟用硬體繪圖支援 (必要的)
  hardware.graphics.enable = true;

  # 啟用 Hyprland 系統組件 (處理 Polkit, Portals 等)
  programs.hyprland.enable = true;

  # 如果你想使用 NVIDIA 顯卡，請取消以下註解：
  # services.xserver.videoDrivers = [ "nvidia" ];
  # hardware.nvidia = {
  #   modesetting.enable = true;
  #   powerManagement.enable = false;
  #   powerManagement.finegrained = false;
  #   open = false;
  #   nvidiaSettings = true;
  #   package = config.boot.kernelPackages.nvidiaPackages.stable;
  # };

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
