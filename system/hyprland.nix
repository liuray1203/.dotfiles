{ pkgs, ... }:

{
  # 啟用 X server（SDDM 需要）
  services.xserver.enable = true;

  # 啟用 SDDM
  services.displayManager.sddm.enable = true;

  # 其他必要的基礎套件
  environment.systemPackages = with pkgs; [
    hyprland
  ];
}

