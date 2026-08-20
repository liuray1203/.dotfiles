{ ... }:

{
  # hyprlock 設定檔 (指紋解鎖 + 密碼備援)
  xdg.configFile."hypr/hyprlock.conf".text = ''
    # --- 一般設定 ---
    general {
      hide_cursor = true
      ignore_empty_input = false
      immediate_render = false
      text_trim = true
      fractional_scaling = 2
      fail_timeout = 2000
    }

    # --- 認證設定 (啟用指紋 + PAM 備援) ---
    auth {
      pam:enabled = true
      pam:module = "login"
      fingerprint:enabled = true
      fingerprint:ready_message = "掃描指紋以解鎖"
      fingerprint:present_message = "感應中..."
      fingerprint:retry_delay = 250
    }

    # --- 動畫 ---
    animations {
      enabled = true
      bezier = linear, 1, 1, 0, 0
      animation = fade, 1, 1.8, linear
    }

    # --- 背景 ---
    background {
      monitor =
      path = screenshot
      color = rgba(1e1e2eff)
      blur_passes = 3
      blur_size = 7
      noise = 0.0117
      contrast = 0.8916
      brightness = 0.8172
      vibrancy = 0.1696
      vibrancy_darkness = 0.05
      reload_time = 0
    }

    # --- 輸入框 (密碼輸入備援) ---
    input-field {
      monitor =
      size = 400, 90
      outline_thickness = 4
      dots_size = 0.25
      dots_spacing = 0.15
      dots_center = true
      dots_rounding = -1
      dots_text_format =
      outer_color = rgba(b4befe80)
      inner_color = rgba(1e1e2eaa)
      font_color = rgba(b4befeff)
      font_family = Noto Sans
      fade_on_empty = true
      fade_timeout = 2000
      placeholder_text = <span foreground="rgba(cdd6f4ff)">輸入密碼 (或掃描指紋)</span>
      fail_text = <span foreground="rgba(f38ba8ff)">驗證失敗</span>
      position = 0, -220
      halign = center
      valign = center
      zindex = 10
    }

    # --- 時鐘 ---
    label {
      monitor =
      text = $TIME
      color = rgba(b4befeff)
      font_size = 72
      font_family = Noto Sans
      position = 0, 80
      halign = center
      valign = center
      zindex = 10
    }

    # --- 日期 ---
    label {
      monitor =
      text = $DATE
      color = rgba(cdd6f4dd)
      font_size = 24
      font_family = Noto Sans
      position = 0, 30
      halign = center
      valign = center
      zindex = 10
    }

    # --- 用戶名 ---
    label {
      monitor =
      text = $USER
      color = rgba(89b4faff)
      font_size = 20
      font_family = Noto Sans
      position = 0, -30
      halign = center
      valign = center
      zindex = 10
    }

    # --- 指紋狀態提示 ---
    label {
      monitor =
      text = $FPRINTPROMPT
      color = rgba(94e2d5ff)
      font_size = 16
      font_family = Noto Sans
      position = 0, -150
      halign = center
      valign = center
      zindex = 10
    }

    # --- 驗證失敗訊息 ---
    label {
      monitor =
      text = $FAIL
      color = rgba(f38ba8ff)
      font_size = 14
      font_family = Noto Sans
      position = 0, -180
      halign = center
      valign = center
      zindex = 10
    }
  '';
}
