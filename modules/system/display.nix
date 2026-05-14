{ pkgs, ... }:

{
  # 停用 X server 與 SDDM (改用 TTY 登入)
  services.xserver.enable = false;
  services.displayManager.sddm.enable = false;

  # 啟用 Mango Compositor (基於 dwl)
  programs.mango = {
    enable = true;
    config = ''
      # --- Autostart ---
      exec-once = ags
      exec-once = fcitx5
      exec-once = swww-daemon
      exec-once = swww img /home/liuray/.dotfiles/images.jpeg

      # --- Appearance ---
      blur = 1
      shadows = 1
      border_radius = 10

      # --- Keybindings ---
      # MOD: super, alt, ctrl, shift, none

      # Basic
      bind = super, return, spawn, kitty
      bind = super, q, killclient
      bind = super, space, spawn, bemenu-run
      bind = super, e, spawn, dolphin
      bind = super, v, togglefloating
      bind = super_shift, q, quit

      # Navigation (Vim style)
      bind = super, h, focusdirection, left
      bind = super, l, focusdirection, right
      bind = super, k, focusdirection, up
      bind = super, j, focusdirection, down

      # Workspaces (Tags)
      bind = super, 1, view, 1
      bind = super, 2, view, 2
      bind = super, 3, view, 3
      bind = super, 4, view, 4
      bind = super, 5, view, 5
      bind = super, 6, view, 6

      # Move to Workspaces
      bind = super_shift, 1, tag, 1
      bind = super_shift, 2, tag, 2
      bind = super_shift, 3, tag, 3
      bind = super_shift, 4, tag, 4
      bind = super_shift, 5, tag, 5
      bind = super_shift, 6, tag, 6

      # Multimedia
      bind = none, XF86AudioRaiseVolume, spawn, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
      bind = none, XF86AudioLowerVolume, spawn, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bind = none, XF86AudioMute, spawn, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bind = none, XF86MonBrightnessUp, spawn, brightnessctl -e4 -n2 set 5%+
      bind = none, XF86MonBrightnessDown, spawn, brightnessctl -e4 -n2 set 5%-

      # Screenshot
      bind = none, Print, spawn, grim -g "$(slurp)" - | wl-copy

      # Reload
      bind = super_shift, r, reload
    '';
  };

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

