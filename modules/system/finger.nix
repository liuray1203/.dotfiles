{ config, pkgs, lib, ... }:

{
  # --- Goodix 指紋辨識器支援 ---
  # Goodix 27c6:6594 (Goodix MOC Fingerprint Sensor) 在 libfprint 1.94.10+ 中原生支援
  # 無需 Touch OEM Drivers (TOD) 或第三方驅動

  # 啟用 fprintd 守靈與 PAM 模組
  # 這會自動為 LY、login、sudo 等預設 PAM 服務加入 pam_fprintd.so
  services.fprintd = {
    enable = true;
  };

  # --- LY 顯示管理員指紋登入 ---
  # LY 使用預設 PAM 規則，當 fprintd 啟用時會自動整合 pam_fprintd.so
  # 驗證流程: 指紋驗證成功 -> 登入成功; 失敗/逾時 -> 自動退回密碼輸入
  services.displayManager.ly = {
    enable = true;
    settings = {
      # LY 在 tty1 上運行
      tty = 1;
    };
  };

  # --- PAM 客製化 (確保 LY 使用預設規則以支援指紋) ---
  # LY 模組預設已使用 useDefaultRules = true，此處明確設定確保整合生效
  security.pam.services.ly = {
    useDefaultRules = true;
    startSession = true;
    unixAuth = true;
  };

  # 確保 fprintAuth 對 LY 啟用 (fprintAuth 預設追蹤 services.fprintd.enable)
  security.pam.services.ly.fprintAuth = lib.mkDefault config.services.fprintd.enable;
}
