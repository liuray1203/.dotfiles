{ pkgs, config, ... }:

{
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
}
