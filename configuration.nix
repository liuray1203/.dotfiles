# .dotfilesold/configuration.nix
{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/system/display.nix
    #./modules/system/nvidia.nix
    ./modules/system/fonts.nix
    ./modules/system/stylix.nix
    ./modules/system/fcitx5.nix

  ];

  # ──────────────────────────────────────────────
  # 1. 系統啟動與基礎設定 (保留舊版穩定設定)
  # ──────────────────────────────────────────────
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Taipei";
  i18n.defaultLocale = "zh_TW.UTF-8";

  # ──────────────────────────────────────────────
  # 2. Ollama：本地 LLM server (Intel CPU 優化)
  # ──────────────────────────────────────────────
  services.ollama = {
    enable       = true;
    host         = "127.0.0.1";
    port         = 11434;
    loadModels   = [ "qwen2.5:7b" ]; # 保留通用模型，移除 hermes/gemma
  };

  # ──────────────────────────────────────────────
  # 3. 使用者與系統維護
  # ──────────────────────────────────────────────
  users.users.liuray = {
    isNormalUser = true;
    description  = "liuray";
    extraGroups  = [ "networkmanager" "wheel" ];
    packages     = with pkgs; [ kdePackages.kate ];
    shell        = pkgs.zsh;
  };

  programs.zsh.enable = true;
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim git wget
  ];

  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store   = true;
  };
  nix.gc = {
    automatic = true;
    dates     = "weekly";
    options   = "--delete-older-than 14d";
  };

  virtualisation.podman = {
    enable       = true;
    dockerCompat = true;
  };

  system.stateVersion = "25.11";

  #加上upower
  services.upower.enable = true;
  services.power-profiles-daemon.enable = false;

#加上tlp

  services.tlp = {
    enable = true;

    settings = {

    CPU_SCALING_GOVERNOR_ON_AC = "performance";
    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

    CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

    WIFI_PWR_ON_BAT = "on";

    USB_AUTOSUSPEND = 1;

    SOUND_POWER_SAVE_ON_BAT = 1;

    PCIE_ASPM_ON_BAT = "powersupersave";

    RUNTIME_PM_ON_BAT = "auto";

    PLATFORM_PROFILE_ON_BAT = "low-power";

    START_CHARGE_THRESH_BAT0 = 75;
    STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };
#蓋上螢幕休眠
  services.logind = {
   lidSwitch = "suspend-then-hibernate";
   lidSwitchExternalPower = "suspend-then-hibernate";
   lidSwitchDocked = "ignore";
  };
}

