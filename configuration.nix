# .dotfilesold/configuration.nix
{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/system/display.nix
    ./modules/system/fonts.nix
    ./modules/system/stylix.nix
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
    acceleration = null;
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
}
